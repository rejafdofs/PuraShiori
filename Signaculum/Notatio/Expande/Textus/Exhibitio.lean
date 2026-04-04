-- Signaculum.Notatio.Expande.Textus.Exhibitio
-- 表示タグ (\\h, \\s, \\i, \\n, \\c, \\b, \\j, \\p, \\_u, \\_m, \\_l, \\&, \\_s) のディスパッチにゃん♪

import Lean
import Signaculum.Sakura.Scriptum
import Signaculum.Notatio.Expande.Auxilium

namespace Signaculum.Notatio.Expande.Textus

open Lean Elab Term
open Signaculum.Notatio.Expande (extractIdentVal expectaNatLit expectaStrLit)

/-- -1 パターンを檢出するにゃん。ident "-1" またはアトム "-" + numLit "1" の兩方に對應にゃ -/
def estNegativusUnus (args : Array Lean.Syntax) : Bool :=
  if args.size == 1 then
    match extractIdentVal args[0]! with
    | some s => s == "-1"
    | none   => false
  else if args.size == 2 then
    match extractIdentVal args[0]! with
    | some "-" =>
      match args[1]!.isNatLit? with
      | some 1 => true
      | _      => false
    | _ => false
  else false

/-- 表示・範圍・表面・改行・清掃・吹出し・跳躍・文字・資源タグのディスパッチにゃん♪
    處理できたら `some term` を返すにゃん -/
def expandeExhibitio (nomen : String) (args : Array Lean.Syntax) (stx : Lean.Syntax)
    : TermElabM (Option (TSyntax `term)) := do
  match nomen with

  -- 範圍制御 (Imperium Scopi)
  | "\\h" => pure <| some (← `(Signaculum.Sakura.Textus.sakura))
  | "\\u" => pure <| some (← `(Signaculum.Sakura.Textus.kero))
  | "\\0" => pure <| some (← `(Signaculum.Sakura.Textus.sakura))
  | "\\1" => pure <| some (← `(Signaculum.Sakura.Textus.kero))

  | "\\p" =>
    if args.size != 1 then
      throwErrorAt stx "\\p: 引數が1つ必要にゃ"
    let n ← expectaNatLit args[0]! "\\p"
    pure <| some (← `(Signaculum.Sakura.Textus.persona $n))

  -- 表面制御 (Imperium Superficiei)
  | "\\s" =>
    if estNegativusUnus args then
      pure <| some (← `(Signaculum.Sakura.Systema.superficiesAbsconde))
    else if args.size == 1 then
      let n ← expectaNatLit args[0]! "\\s"
      pure <| some (← `(Signaculum.Sakura.Textus.superficies $n))
    else
      throwErrorAt stx "\\s: 引數が不正にゃ"

  | "\\i" =>
    if args.size == 1 then
      let n ← expectaNatLit args[0]! "\\i"
      pure <| some (← `(Signaculum.Sakura.Textus.animatio $n))
    else if args.size == 2 then
      let n ← expectaNatLit args[0]! "\\i"
      match extractIdentVal args[1]! with
      | some "wait" => pure <| some (← `(Signaculum.Sakura.Systema.animatioExpecta $n))
      | _           => throwErrorAt stx "\\i: 第2引數は 'wait' が期待されてゐますにゃ"
    else
      throwErrorAt stx "\\i: 引數が不正にゃ"

  -- 改行 (Lineae)
  | "\\n" =>
    if args.size == 0 then
      pure <| some (← `(Signaculum.Sakura.Textus.linea))
    else if args.size == 1 then
      match extractIdentVal args[0]! with
      | some "half" => pure <| some (← `(Signaculum.Sakura.Textus.dimidiaLinea))
      | _           => throwErrorAt stx "\\n: 不明な引數にゃ"
    else if args.size == 2 then
      match extractIdentVal args[0]! with
      | some "percent" =>
        let n ← expectaNatLit args[1]! "\\n"
        pure <| some (← `(Signaculum.Sakura.Textus.lineaProportionalis $n))
      | _ => throwErrorAt stx "\\n: 不明な引數にゃ"
    else
      throwErrorAt stx "\\n: 引數が多すぎるにゃ"

  | "\\_n" => pure <| some (← `(Signaculum.Sakura.Textus.linearisAbrogatur))

  -- 清掃 (Purgatio)
  | "\\c" =>
    if args.size == 0 then
      pure <| some (← `(Signaculum.Sakura.Textus.purga))
    else if args.size == 2 then
      match extractIdentVal args[0]! with
      | some "char" =>
        let n ← expectaNatLit args[1]! "\\c"
        pure <| some (← `(Signaculum.Sakura.Textus.purgaCharacterem $n))
      | some "line" =>
        let n ← expectaNatLit args[1]! "\\c"
        pure <| some (← `(Signaculum.Sakura.Textus.purgaLineam $n))
      | _ => throwErrorAt stx "\\c: 不明な引數にゃ"
    else if args.size == 3 then
      match extractIdentVal args[0]! with
      | some "char" =>
        let n ← expectaNatLit args[1]! "\\c"
        let i ← expectaNatLit args[2]! "\\c"
        pure <| some (← `(Signaculum.Sakura.Textus.purgaCharacteremAb $n $i))
      | some "line" =>
        let n ← expectaNatLit args[1]! "\\c"
        let i ← expectaNatLit args[2]! "\\c"
        pure <| some (← `(Signaculum.Sakura.Textus.purgaLineamAb $n $i))
      | _ => throwErrorAt stx "\\c: 不明な引數にゃ"
    else
      throwErrorAt stx "\\c: 引數が不正にゃ"

  | "\\C" => pure <| some (← `(Signaculum.Sakura.Textus.adscribe))

  -- 吹出し (Bulla)
  | "\\b" =>
    if estNegativusUnus args then
      pure <| some (← `(Signaculum.Sakura.bullaAbsconde))
    else if args.size == 1 then
      let n ← expectaNatLit args[0]! "\\b"
      pure <| some (← `(Signaculum.Sakura.Textus.bulla $n))
    else
      throwErrorAt stx "\\b: 引數が不正にゃ"

  -- 跳躍 (Saltum)
  | "\\j" =>
    if args.size == 1 then
      let s ← expectaStrLit args[0]! "\\j"
      pure <| some (← `(Signaculum.Sakura.Textus.saltum $s))
    else
      throwErrorAt stx "\\j: 文字列引數が1つ必要にゃ"

  -- 同期 (Synchronia)
  | "\\_s" =>
    if args.size == 0 then
      pure <| some (← `(Signaculum.Sakura.Textus.synchrona))
    else
      let mut termElems : Array (TSyntax `term) := #[]
      for h : idx in [:args.size] do
        let n ← expectaNatLit args[idx] "\\_s"
        termElems := termElems.push (← `(term| $n))
      pure <| some (← `(Signaculum.Sakura.Systema.synchronaScopi [$termElems,*]))

  -- 文字 (Characteres)
  | "\\_u" =>
    if args.size == 1 then
      let s ← expectaStrLit args[0]! "\\_u"
      pure <| some (← `(Signaculum.Sakura.Textus.characterUnicode $s))
    else
      throwErrorAt stx "\\_u: 文字列引數が1つ必要にゃ"

  | "\\_m" =>
    if args.size == 1 then
      let s ← expectaStrLit args[0]! "\\_m"
      pure <| some (← `(Signaculum.Sakura.Textus.characterMessage $s))
    else
      throwErrorAt stx "\\_m: 文字列引數が1つ必要にゃ"

  | "\\_l" =>
    if args.size == 2 then
      let x ← expectaStrLit args[0]! "\\_l"
      let y ← expectaStrLit args[1]! "\\_l"
      pure <| some (← `(Signaculum.Sakura.Textus.cursor $x $y))
    else
      throwErrorAt stx "\\_l: 文字列引數が2つ必要にゃ"

  -- 資源 (Resourcea)
  | "\\&" =>
    if args.size == 1 then
      let s ← expectaStrLit args[0]! "\\&"
      pure <| some (← `(Signaculum.Sakura.Systema.referentiaResourcei $s))
    else
      throwErrorAt stx "\\&: 文字列引數が1つ必要にゃ"

  | _ => pure none

end Signaculum.Notatio.Expande.Textus
