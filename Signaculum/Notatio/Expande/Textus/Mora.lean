-- Signaculum.Notatio.Expande.Textus.Mora
-- 待機タグ (\\w, \\_w, \\__w, \\x, \\t) のディスパッチにゃん♪

import Lean
import Signaculum.Sakura.Scriptum
import Signaculum.Notatio.Expande.Auxilium

namespace Signaculum.Notatio.Expande.Textus

open Lean Elab Term
open Signaculum.Notatio.Expande (extractIdentVal expectaNatLit)

/-- 待機タグのディスパッチにゃん。處理できたら `some term` を返すにゃん -/
def expandeMora (nomen : String) (args : Array Lean.Syntax) (stx : Lean.Syntax)
    : TermElabM (Option (TSyntax `term)) := do
  match nomen with

  | "\\w" =>
    if args.size == 1 then
      let n ← expectaNatLit args[0]! "\\w"
      pure <| some (← `(Signaculum.Sakura.Textus.moraCeler $n))
    else
      throwErrorAt stx "\\w: 數値引數が1つ必要にゃ"

  | "\\_w" =>
    if args.size == 1 then
      let n ← expectaNatLit args[0]! "\\_w"
      pure <| some (← `(Signaculum.Sakura.Textus.mora $n))
    else
      throwErrorAt stx "\\_w: 數値引數が1つ必要にゃ"

  | "\\__w" =>
    if args.size == 1 then
      match extractIdentVal args[0]! with
      | some "clear" => pure <| some (← `(Signaculum.Sakura.Systema.reseraTimerSynchrinae))
      | _ =>
        let n ← expectaNatLit args[0]! "\\__w"
        pure <| some (← `(Signaculum.Sakura.Textus.moraAbsoluta $n))
    else if args.size == 2 then
      match extractIdentVal args[0]! with
      | some "animation" =>
        let n ← expectaNatLit args[1]! "\\__w"
        pure <| some (← `(Signaculum.Sakura.Systema.moraAnimationem $n))
      | _ => throwErrorAt stx "\\__w: 不明な引數にゃ"
    else
      throwErrorAt stx "\\__w: 引數が不正にゃ"

  | "\\x" =>
    if args.size == 0 then
      pure <| some (← `(Signaculum.Sakura.Textus.expecta))
    else if args.size == 1 then
      match extractIdentVal args[0]! with
      | some "noclear" => pure <| some (← `(Signaculum.Sakura.Textus.expectaSine))
      | _              => throwErrorAt stx "\\x: 不明な引數にゃ"
    else
      throwErrorAt stx "\\x: 引數が不正にゃ"

  | "\\t" => pure <| some (← `(Signaculum.Sakura.Textus.tempusCriticum))

  | _ => pure none

end Signaculum.Notatio.Expande.Textus
