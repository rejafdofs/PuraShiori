-- Signaculum.Auxilium.Communicatio
-- ゴースト間通信・名前遷移ヘルパーにゃん♪ あやりりす風のゴースト名處理を提供するにゃ

set_option autoImplicit false

namespace Signaculum.Auxilium.Communicatio

-- ═══════════════════════════════════════════════════
--  ゴースト名の安全化 (Mundatio Nominis)
-- ═══════════════════════════════════════════════════

/-- ゴースト名中の特殊文字を安全な文字に置換するにゃん♪
    あやりりすと同樣に `+`, `-`, `"`, `'` を `_` に變換するにゃ -/
def mundaNomen (nomen : String) : String :=
  nomen.toList.map (fun c =>
    if c == '+' || c == '-' || c == '"' || c == '\'' then '_' else c
  ) |> String.ofList

-- ═══════════════════════════════════════════════════
--  キーワード検索 (Quaestio Verborum)
-- ═══════════════════════════════════════════════════

/-- 文字列中に部分文字列が含まれるか判定するにゃん -/
private def continet (haystack needle : String) : Bool :=
  (haystack.splitOn needle).length > 1

/-- テキスト中にいずれかのキーワードが含まれるか檢索するにゃん♪
    コミュニケート内容のキーワードマッチに使ふにゃ -/
def quaereVerbumAliquod (textus : String) (verba : List String) : Bool :=
  verba.any (continet textus)

/-- テキスト中にすべてのキーワードが含まれるか檢索するにゃん♪ -/
def quaereVerbaOmnia (textus : String) (verba : List String) : Bool :=
  verba.all (continet textus)

-- ═══════════════════════════════════════════════════
--  コミュニケート解析 (Analysis Communicationis)
-- ═══════════════════════════════════════════════════

/-- コミュニケート要求からゴースト名と發言内容を取り出すにゃん♪
    OnCommunicate の Reference0 = 發言者名、Reference1 = 發言内容 にゃ -/
structure Communicatum where
  /-- 發言者のゴースト名にゃ -/
  mittens  : String
  /-- 發言内容にゃ -/
  textus   : String
  deriving Repr, Inhabited

/-- Rogatio の Reference から Communicatum を構築するにゃん -/
def exReferentiis (ref0 ref1 : Option String) : Communicatum :=
  { mittens := ref0.getD "", textus := ref1.getD "" }

-- ═══════════════════════════════════════════════════
--  さくらスクリプトの除去 (Ablatio Scripti)
-- ═══════════════════════════════════════════════════

/-- さくらスクリプトのタグを除去するにゃん♪
    `\s[0]` `\n` `\e` 等のタグを取り除いて平文にするにゃ -/
partial def auferScriptum (s : String) : String :=
  let rec go (cs : List Char) (acc : List Char) (inTag : Bool) : List Char :=
    match cs with
    | [] => acc.reverse
    | '\\' :: rest =>
      if inTag then go rest acc true
      else
        -- タグの開始にゃ。次の文字によって處理を分けるにゃん
        match rest with
        | '!' :: '[' :: rest2 =>
          -- \![...] 形式のタグにゃん。']' まで讀み飛ばすにゃ
          let rec skipBracket (cs : List Char) : List Char :=
            match cs with
            | [] => []
            | ']' :: rest3 => rest3
            | _ :: rest3 => skipBracket rest3
          go (skipBracket rest2) acc false
        | c :: rest2 =>
          if c == 'n' then
            -- \n は改行にゃん
            go rest2 acc false
          else if c == 'e' || c == 'c' || c == 'x' then
            -- 終了タグにゃ
            go rest2 acc false
          else if c == 'h' || c == 'u' then
            -- キャラ切替にゃ
            go rest2 acc false
          else if c == 's' || c == 'b' || c == 'w' || c == 'f' then
            -- 引數附きタグにゃん。'[' ... ']' を讀み飛ばすにゃ
            match rest2 with
            | '[' :: rest3 =>
              let rec skipBracketArg (cs : List Char) : List Char :=
                match cs with
                | [] => []
                | ']' :: rest4 => rest4
                | _ :: rest4 => skipBracketArg rest4
              go (skipBracketArg rest3) acc false
            | _ => go rest2 acc false
          else
            -- 未知のタグは飛ばすにゃ
            go rest2 acc false
        | [] => acc.reverse
    | c :: rest =>
      if inTag then go rest acc true
      else go rest (c :: acc) false
  String.ofList (go s.toList [] false)

-- ═══════════════════════════════════════════════════
--  HTML エスケープ (Evasio HTML)
-- ═══════════════════════════════════════════════════

/-- HTML 特殊文字をエスケープするにゃん♪ -/
def evadeHTML (s : String) : String :=
  s.toList.foldl (init := "") fun acc c =>
    acc ++ match c with
    | '&'  => "&amp;"
    | '<'  => "&lt;"
    | '>'  => "&gt;"
    | '"'  => "&quot;"
    | '\'' => "&#39;"
    | c    => c.toString

end Signaculum.Auxilium.Communicatio
