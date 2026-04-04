-- Signaculum.Notatio.Parsitor
-- scriptum ブロック用カスタムパーサー本體にゃん♪
-- 先頭文字で分岐して全サクラスクリプトトークンを直接パースするにゃ

import Signaculum.Notatio.Parsitor.Argumenta

namespace Signaculum.Notatio.Parsitor

open Lean Parser

-- ════════════════════════════════════════════════════
--  ノードカインド宣言
-- ════════════════════════════════════════════════════

def lexemaTextusNudus : SyntaxNodeKind := `Signaculum.Notatio.lexemaTextusNudus
def lexemaSignum      : SyntaxNodeKind := `Signaculum.Notatio.lexemaSignum
def lexemaSignumExcl  : SyntaxNodeKind := `Signaculum.Notatio.lexemaSignumExcl
def lexemaFontis      : SyntaxNodeKind := `Signaculum.Notatio.lexemaFontis
def lexemaExpressio   : SyntaxNodeKind := `Signaculum.Notatio.lexemaExpressio
def lexemaTextusLit   : SyntaxNodeKind := `Signaculum.Notatio.lexemaTextusLit
def lexemaVariabilis            : SyntaxNodeKind := `Signaculum.Notatio.lexemaVariabilis
def lexemaProprietasCitata      : SyntaxNodeKind := `Signaculum.Notatio.lexemaProprietasCitata

-- ════════════════════════════════════════════════════
--  タグ開始文字判定
-- ════════════════════════════════════════════════════

private def estInitiumTagi (ch : Char) : Bool :=
  ch == '\\' || ch == '"' || ch == '{' || ch == '}' || ch == '%' ||
  ch == ')' || ch == ']'

-- ════════════════════════════════════════════════════
--  裸テクストゥスパーサー
-- ════════════════════════════════════════════════════

private def rawTextusFn (c : ParserContext) (s : ParserState) : ParserState :=
  let input := c.fileMap.source
  let s := skipWsFn c s
  let startPos := s.pos
  let (endPos, str) := Id.run do
    let mut p := startPos
    let mut acc : String := ""
    while p.byteIdx < input.utf8ByteSize do
      let ch := p.get input
      if ch == ' ' || ch == '\t' || ch == '\n' || ch == '\r' then break
      if estInitiumTagi ch then break
      acc := acc.push ch
      p := p.next input
    return (p, acc)
  if endPos == startPos then
    let ch := if startPos.byteIdx < input.utf8ByteSize then
      s!" (現在の文��: '{startPos.get input}')" else " (入力末尾)"
    s.mkError s!"テクストゥスが期待されてゐますにゃ{ch}"
  else
    let identNode := Syntax.ident (SourceInfo.synthetic startPos endPos) str.toRawSubstring (Name.mkSimple str) []
    let node := Syntax.node (SourceInfo.synthetic startPos endPos) lexemaTextusNudus #[identNode]
    let s := skipWsFn c { s with pos := endPos }
    { s with stxStack := s.stxStack.push node }

-- ════════════════════════════════════════════════════
--  タグ名・キー讀取
-- ════════════════════════════════════════════════════

private def legeNomenTagi (input : String) (startPos : String.Pos.Raw) : String × String.Pos.Raw :=
  Id.run do
    let mut p := startPos
    let mut nomen := "\\"
    while p.byteIdx < input.utf8ByteSize && p.get input == '_' do
      nomen := nomen.push '_'
      p := p.next input
    if p.byteIdx < input.utf8ByteSize then
      let ch := p.get input
      if ch.isAlpha || ch.isDigit || ch == '!' || ch == '&' then
        nomen := nomen.push ch
        p := p.next input
    return (nomen, p)

private def legeCmdPartFn (input : String) (startPos : String.Pos.Raw) : String × String.Pos.Raw :=
  Id.run do
    let mut p := startPos
    let mut acc := ""
    while p.byteIdx < input.utf8ByteSize do
      let ch := p.get input
      if ch == ',' || ch == ']' || ch == ' ' || ch == '\t' || ch == '\n' then break
      acc := acc.push ch
      p := p.next input
    return (acc, p)

private def legeFontKeyFn (input : String) (startPos : String.Pos.Raw) : String × String.Pos.Raw :=
  Id.run do
    let mut p := startPos
    let mut acc := ""
    while p.byteIdx < input.utf8ByteSize do
      let ch := p.get input
      if ch.isAlphanum || ch == '.' then
        acc := acc.push ch
        p := p.next input
      else break
    return (acc, p)

-- ════════════════════════════════════════════════════
--  ノード組立補助
-- ════════════════════════════════════════════════════

private def mkSignumNode (c : ParserContext) (s : ParserState) (bsPos : String.Pos.Raw)
    (kind : SyntaxNodeKind) (label : String) (args : Array Syntax) : ParserState :=
  let labelAtom := mkAtom (SourceInfo.synthetic bsPos s.pos) label
  let argsNode := Syntax.node SourceInfo.none nullKind args
  let node := Syntax.node (SourceInfo.synthetic bsPos s.pos) kind #[labelAtom, argsNode]
  let s := skipWsFn c s
  { s with stxStack := s.stxStack.push node }

-- ════════════════════════════════════════════════════
--  汎用括弧內引數再帰讀取 (legeSequelaInUncis)
--  \![cmd, ...] と \f[key, ...] の共通パターンにゃん♪
-- ════════════════════════════════════════════════════

/-- ']' で閉ぢるカンマ區切り引數列を再帰的に讀み、
    指定の kind でノードを組立てるにゃん♪
    `praefixumErroris` はエラーメッセージ用の接頭辭（例: "\\![raise]", "\\f[color]"）にゃ -/
partial def legeSequelaInUncis (praefixumErroris : String) (kind : SyntaxNodeKind)
    (label : String) (c : ParserContext) (s : ParserState)
    (stackSz : Nat) (bsPos : String.Pos.Raw) : ParserState :=
  let input := c.fileMap.source
  if s.pos.byteIdx >= input.utf8ByteSize then
    s.mkError s!"{praefixumErroris}: ']' が期待されてゐますにゃ"
  else if s.pos.get input == ']' then
    let s := { s with pos := s.pos.next input }
    let elems := s.stxStack.extract stackSz s.stxStack.size
    let s := { s with stxStack := s.stxStack.shrink stackSz }
    mkSignumNode c s bsPos kind label elems
  else if s.pos.get input == ',' then
    let s := skipWsFn c { s with pos := s.pos.next input }
    if s.pos.byteIdx < input.utf8ByteSize && s.pos.get input == ']' then
      let s := { s with pos := s.pos.next input }
      let elems := s.stxStack.extract stackSz s.stxStack.size
      let s := { s with stxStack := s.stxStack.shrink stackSz }
      mkSignumNode c s bsPos kind label elems
    else
      let s := argumentumFn c s
      if s.hasError then s.mkError s!"{praefixumErroris}: 引數が不正にゃ (カンマ後の要素)"
      else legeSequelaInUncis praefixumErroris kind label c (skipWsFn c s) stackSz bsPos
  else
    let actual := if s.pos.byteIdx < input.utf8ByteSize then
      s!" (實際: '{s.pos.get input}')" else ""
    s.mkError s!"{praefixumErroris}: , か ] が期待されてゐますにゃ{actual}"

private def parsitorSignumExclFn (c : ParserContext) (s : ParserState) (bsPos : String.Pos.Raw)
    : ParserState :=
  let input := c.fileMap.source
  let s := skipWsFn c s
  if s.pos.byteIdx >= input.utf8ByteSize || s.pos.get input != '[' then
    s.mkError "\\!: '[' が期待されてゐますにゃ"
  else
    let s := skipWsFn c { s with pos := s.pos.next input }
    let (imperium, afterCmd) := legeCmdPartFn input s.pos
    if imperium.isEmpty then
      -- 補完用プレースホルダーにゃ（\![  ] の場合）
      if s.pos.byteIdx < input.utf8ByteSize && s.pos.get input == ']' then
        let s := { s with pos := s.pos.next input }
        mkSignumNode c s bsPos lexemaSignumExcl "" #[]
      else
        s.mkError "\\!: コマンド名が期待されてゐますにゃ"
    else
      let s := skipWsFn c { s with pos := afterCmd }
      legeSequelaInUncis s!"\\![{imperium}]" lexemaSignumExcl imperium c s s.stxStack.size bsPos

-- \f[key, values...] は legeSequelaInUncis で處理するにゃん♪

private def parsitorFontisFn (c : ParserContext) (s : ParserState) (bsPos : String.Pos.Raw)
    : ParserState :=
  let input := c.fileMap.source
  let s := skipWsFn c s
  if s.pos.byteIdx >= input.utf8ByteSize || s.pos.get input != '[' then
    s.mkError "\\f: '[' が期待されてゐますにゃ"
  else
    let s := skipWsFn c { s with pos := s.pos.next input }
    let (clavis, afterKey) := legeFontKeyFn input s.pos
    if clavis.isEmpty then
      -- 補完用プレースホルダーにゃ（\f[  ] の場合）
      if s.pos.byteIdx < input.utf8ByteSize && s.pos.get input == ']' then
        let s := { s with pos := s.pos.next input }
        mkSignumNode c s bsPos lexemaFontis "" #[]
      else
        s.mkError "\\f: フォントキーが期待されてゐますにゃ"
    else
      let s := skipWsFn c { s with pos := afterKey }
      legeSequelaInUncis s!"\\f[{clavis}]" lexemaFontis clavis c s s.stxStack.size bsPos

-- ════════════════════════════════════════════════════
--  一般 \tag / \tag[args]
-- ════════════════════════════════════════════════════

private def parsitorSignumFn (c : ParserContext) (s : ParserState) (bsPos : String.Pos.Raw) (nomen : String)
    : ParserState :=
  let input := c.fileMap.source
  let s := skipWsFn c s
  if nomen == "\\w" && s.pos.byteIdx < input.utf8ByteSize && (s.pos.get input).isDigit then
    let s := numLitFn c s
    if s.hasError then s
    else
      let numNode := s.stxStack.back
      let s := { s with stxStack := s.stxStack.pop }
      mkSignumNode c (skipWsFn c s) bsPos lexemaSignum nomen #[numNode]
  else if s.pos.byteIdx < input.utf8ByteSize && s.pos.get input == '[' then
    let s := argumentaInUncisFn nomen c s
    if s.hasError then s
    else
      let argsNode := s.stxStack.back
      let s := { s with stxStack := s.stxStack.pop }
      -- argsNode は nullKind ノードにゃ。中身を取り出すにゃ
      let nomenAtom := mkAtom (SourceInfo.synthetic bsPos s.pos) nomen
      let node := Syntax.node (SourceInfo.synthetic bsPos s.pos) lexemaSignum #[nomenAtom, argsNode]
      let s := skipWsFn c s
      { s with stxStack := s.stxStack.push node }
  else
    mkSignumNode c s bsPos lexemaSignum nomen #[]

-- ════════════════════════════════════════════════════
--  バックスラッシュタグ統合
-- ════════════════════════════════════════════════════

private def parsitorTagiFn (c : ParserContext) (s : ParserState) : ParserState :=
  let input := c.fileMap.source
  let bsPos := s.pos
  let afterBs := bsPos.next input
  if afterBs.byteIdx >= input.utf8ByteSize then
    -- 入力末尾の \ は補完用プレースホルダーにゃ
    mkSignumNode c { s with pos := afterBs } bsPos lexemaSignum "\\" #[]
  else
    let nextCh := afterBs.get input
    if nextCh == '{' || nextCh == '}' then
      let endPos := afterBs.next input
      mkSignumNode c { s with pos := endPos } bsPos lexemaSignum ("\\" ++ String.singleton nextCh) #[]
    else
      let (nomen, afterNomen) := legeNomenTagi input afterBs
      if nomen == "\\" then
        -- 補完用プレースホルダーにゃ
        mkSignumNode c { s with pos := afterBs } bsPos lexemaSignum "\\" #[]
      else if nomen == "\\!" then
        parsitorSignumExclFn c { s with pos := afterNomen } bsPos
      else if nomen == "\\f" then
        parsitorFontisFn c { s with pos := afterNomen } bsPos
      else
        parsitorSignumFn c { s with pos := afterNomen } bsPos nomen

-- ════════════════════════════════════════════════════
--  文字列リテラルパーサー
-- ════════════════════════════════════════════════════

private def parsitorTextusLitFn (c : ParserContext) (s : ParserState) : ParserState :=
  let s := strLitFn c s
  if s.hasError then s
  else
    let strNode := s.stxStack.back
    let s := { s with stxStack := s.stxStack.pop }
    let node := Syntax.node (strNode.getHeadInfo) lexemaTextusLit #[strNode]
    let s := skipWsFn c s
    { s with stxStack := s.stxStack.push node }

-- ════════════════════════════════════════════════════
--  式埋込パーサー
-- ════════════════════════════════════════════════════

private def parsitorExpressionisFn (c : ParserContext) (s : ParserState) : ParserState :=
  let input := c.fileMap.source
  let startPos := s.pos
  let s := { s with pos := s.pos.next input }
  let s := (termParser maxPrec).fn c s
  if s.hasError then s
  else
    let termNode := s.stxStack.back
    let s := { s with stxStack := s.stxStack.pop }
    let s := skipWsFn c s
    if s.pos.byteIdx >= input.utf8ByteSize || s.pos.get input != '}' then
      let actual := if s.pos.byteIdx < input.utf8ByteSize then
        s!" (實際: '{s.pos.get input}')" else " (入力末尾)"
      let lbrace := "{"
      let rbrace := "}"
      s.mkError s!"'{lbrace}' 式の閉ぢ '{rbrace}' が期待されてゐますにゃ{actual}"
    else
      let s := { s with pos := s.pos.next input }
      let node := Syntax.node (SourceInfo.synthetic startPos s.pos) lexemaExpressio #[termNode]
      let s := skipWsFn c s
      { s with stxStack := s.stxStack.push node }

-- ════════════════════════════════════════════════════
--  環境變數パーサー
-- ════════════════════════════════════════════════════

private def parsitorVariabilisFn (c : ParserContext) (s : ParserState) : ParserState :=
  let input := c.fileMap.source
  let startPos := s.pos
  let s := { s with pos := s.pos.next input }  -- '%' を消費にゃ
  let identStart := s.pos
  let (nomen, afterIdent) := Id.run do
    let mut p := identStart
    let mut acc := ""
    while p.byteIdx < input.utf8ByteSize do
      let ch := p.get input
      if ch.isAlphanum || ch == '_' then
        acc := acc.push ch
        p := p.next input
      else break
    return (acc, p)
  if nomen.isEmpty then
    s.mkError "%: 變數名が期待されてゐますにゃ"
  else if nomen == "property" && afterIdent.byteIdx < input.utf8ByteSize
                               && afterIdent.get input == '[' then
    -- %property[<term>] にゃん♪ 常に termParser で讀むにゃ
    let s := { s with pos := afterIdent.next input }  -- '[' を消費にゃ
    let s := skipWsFn c s
    let s := (Lean.Parser.termParser 0).fn c s
    if s.hasError then s
    else
      let termNode := s.stxStack.back
      let s := { s with stxStack := s.stxStack.pop }
      let s := skipWsFn c s
      if s.pos.byteIdx >= input.utf8ByteSize || s.pos.get input != ']' then
        s.mkError "%property: ']' が期待されてゐますにゃ"
      else
        let s := { s with pos := s.pos.next input }  -- ']' を消費にゃ
        let node := Syntax.node (SourceInfo.synthetic startPos s.pos)
                      lexemaProprietasCitata #[termNode]
        let s := skipWsFn c s
        { s with stxStack := s.stxStack.push node }
  else
    -- 通常の環境變數にゃ
    let identNode := Syntax.ident (SourceInfo.synthetic identStart afterIdent)
                       nomen.toRawSubstring (Name.mkSimple nomen) []
    let node := Syntax.node (SourceInfo.synthetic startPos afterIdent)
                  lexemaVariabilis #[identNode]
    let s := skipWsFn c { s with pos := afterIdent }
    { s with stxStack := s.stxStack.push node }

-- ════════════════════════════════════════════════════
--  統合パーサー
-- ════════════════════════════════════════════════════

def sakuraLexemaFn (c : ParserContext) (s : ParserState) : ParserState :=
  let input := c.fileMap.source
  let s := skipWsFn c s
  if s.pos.byteIdx >= input.utf8ByteSize then
    s.mkError "トークンが期待されてゐますにゃ"
  else
    let ch := s.pos.get input
    -- Lean コメント（--）はスクリプトゥムの一部ではにゃいにゃ
    if ch == '-' && (s.pos.next input).byteIdx < input.utf8ByteSize
                 && (s.pos.next input).get input == '-' then
      s.mkError "コメントにゃ"
    else if ch == '\\' then parsitorTagiFn c s
    else if ch == '"' then parsitorTextusLitFn c s
    else if ch == '{' then parsitorExpressionisFn c s
    else if ch == '%' then parsitorVariabilisFn c s
    else if ch == '}' || ch == ']' || ch == ')' then
      s.mkError s!"對應しない '{ch}' にゃ"
    else rawTextusFn c s

def sakuraLexemaParser : Parser where
  fn := sakuraLexemaFn
  info := {}

@[combinator_formatter Signaculum.Notatio.Parsitor.sakuraLexemaParser]
def sakuraLexemaParser.formatter : PrettyPrinter.Formatter := pure ()

@[combinator_parenthesizer Signaculum.Notatio.Parsitor.sakuraLexemaParser]
def sakuraLexemaParser.parenthesizer : PrettyPrinter.Parenthesizer := pure ()

end Signaculum.Notatio.Parsitor
