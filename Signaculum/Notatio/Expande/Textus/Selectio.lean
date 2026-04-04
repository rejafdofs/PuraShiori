-- Signaculum.Notatio.Expande.Textus.Selectio
-- 選擇肢・錨タグ (\\_a, \\q, \\__q) のディスパッチにゃん♪

import Lean
import Signaculum.Sakura.Scriptum
import Signaculum.Syntaxis
import Signaculum.Notatio.Expande.Auxilium

namespace Signaculum.Notatio.Expande.Textus

open Lean Elab Term Meta
open Signaculum.Notatio.Expande (extractIdentVal expectaStrLit resolveCallbackum)

/-- 選擇肢・錨タグのディスパッチにゃん。處理できたら `some term` を返すにゃん -/
def expandeSelectio (nomen : String) (args : Array Lean.Syntax) (stx : Lean.Syntax)
    : TermElabM (Option (TSyntax `term)) := do
  match nomen with

  -- 錨 (Ancora)
  | "\\_a" =>
    if args.size == 0 then
      pure <| some (← `(Signaculum.Sakura.Textus.fineAncora))
    else
      let cb := args[0]!
      let res ← resolveCallbackum cb (args.size - 1)
      some <$> res.cumActione fun evStx paramTypes => do
        if args.size == 1 then
          `(Signaculum.Sakura.Textus.ancora $evStx)
        else
          let refArgs ← Signaculum.toRefCumTypo (args.extract 1 args.size) paramTypes
          `(Signaculum.Sakura.Textus.ancora $evStx [$refArgs,*])

  -- 選擇肢 (Optiones)
  | "\\q" =>
    if args.size == 2 then
      let t ← expectaStrLit args[0]! "\\q"
      let cb := args[1]!
      if cb.isStrLit?.isSome then
        pure <| some (← `(Signaculum.Sakura.Textus.optio $t $(⟨cb⟩)))
      else
        let res ← resolveCallbackum cb 0
        some <$> res.cumActione fun evStx _ => do
          `(Signaculum.Sakura.Textus.optioEventum $t $evStx)
    else if args.size >= 3 then
      let t ← expectaStrLit args[0]! "\\q"
      if args.size == 3 then
        match extractIdentVal args[1]! with
        | some "script:" =>
          let sc ← expectaStrLit args[2]! "\\q"
          pure <| some (← `(Signaculum.Sakura.Textus.optioScriptum $t $sc))
        | _ =>
          let cb := args[1]!
          let res ← resolveCallbackum cb (args.size - 2)
          some <$> res.cumActione fun evStx paramTypes => do
            let refArgs ← Signaculum.toRefCumTypo (args.extract 2 args.size) paramTypes
            `(Signaculum.Sakura.Textus.optioEventum $t $evStx [$refArgs,*])
      else
        let cb := args[1]!
        let res ← resolveCallbackum cb (args.size - 2)
        some <$> res.cumActione fun evStx paramTypes => do
          let refArgs ← Signaculum.toRefCumTypo (args.extract 2 args.size) paramTypes
          `(Signaculum.Sakura.Textus.optioEventum $t $evStx [$refArgs,*])
    else
      throwErrorAt stx "\\q: 引數が不足してゐますにゃ"

  -- 範圍選擇肢 (Optio Scopi)
  | "\\__q" =>
    if args.size == 0 then
      pure <| some (← `(Signaculum.Sakura.Textus.fineOptioScopus))
    else
      let cb := args[0]!
      let res ← resolveCallbackum cb (args.size - 1)
      some <$> res.cumActione fun evStx paramTypes => do
        if args.size == 1 then
          `(Signaculum.Sakura.Textus.optioScopus $evStx)
        else
          let refArgs ← Signaculum.toRefCumTypo (args.extract 1 args.size) paramTypes
          `(Signaculum.Sakura.Textus.optioScopus $evStx [$refArgs,*])

  | _ => pure none

end Signaculum.Notatio.Expande.Textus
