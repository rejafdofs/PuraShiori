-- Signaculum.Notatio.Expande.Textus.Imperium
-- 制御タグ (\\e, \\_q, \\-, \\+, \\*, etc.) のディスパッチにゃん♪

import Lean
import Signaculum.Sakura.Scriptum
import Signaculum.Notatio.Expande.Auxilium

namespace Signaculum.Notatio.Expande.Textus

open Lean Elab Term
open Signaculum.Notatio.Expande (extractIdentVal expectaNatLit expectaStrLit)

/-- 制御タグのディスパッチにゃん。處理できたら `some term` を返すにゃん -/
def expandeImperium (nomen : String) (_args : Array Lean.Syntax) (_stx : Lean.Syntax)
    : TermElabM (Option (TSyntax `term)) := do
  match nomen with
  | "\\e"  => pure <| some (← `(Signaculum.Sakura.Textus.finis))
  | "\\_q" => pure <| some (← `(Signaculum.Sakura.Textus.celer))
  | "\\-"  => pure <| some (← `(Signaculum.Sakura.Textus.exitus))
  | "\\+"  => pure <| some (← `(Signaculum.Sakura.Textus.mutaGhost))
  | "\\*"  => pure <| some (← `(Signaculum.Sakura.Textus.prohibeTempus))
  | "\\_+" => pure <| some (← `(Signaculum.Sakura.Systema.mutaGhostSequens))
  | "\\v"  => pure <| some (← `(Signaculum.Sakura.Systema.togglaSupra))
  | "\\4"  => pure <| some (← `(Signaculum.Sakura.Textus.recede))
  | "\\5"  => pure <| some (← `(Signaculum.Sakura.Textus.accede))
  | "\\6"  => pure <| some (← `(Signaculum.Sakura.Systema.syncTempus))
  | "\\7"  => pure <| some (← `(Signaculum.Sakura.Systema.eventumTempus))
  | "\\_?" => pure <| some (← `(Signaculum.Sakura.Systema.inhibeTagas))
  | "\\_V" => pure <| some (← `(Signaculum.Sakura.Systema.expectaSonum))
  | "\\{" => pure <| some (← `(Signaculum.Sakura.loqui "{"))
  | "\\}" => pure <| some (← `(Signaculum.Sakura.loqui "}"))
  | _ => pure none

end Signaculum.Notatio.Expande.Textus
