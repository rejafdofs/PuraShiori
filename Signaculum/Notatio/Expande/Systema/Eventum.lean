-- Signaculum.Notatio.Expande.Systema.Eventum
-- 事象・通知・埋込・タイマーのディスパッチにゃん♪
-- raise/embed/notify とそのタイマー變種を扱ふにゃ

import Lean
import Signaculum.Sakura.Scriptum
import Signaculum.Syntaxis
import Signaculum.Notatio.Expande.Auxilium

namespace Signaculum.Notatio.Expande.Systema

open Lean Elab Term Meta
open Signaculum.Notatio.Expande (resolveCallbackum expectaStrLit)

-- ════════════════════════════════════════════════════
--  事象ディスパッチ (Dispatch Eventuum)
-- ════════════════════════════════════════════════════

/-- raise/embed/notify/timer 系タグのディスパッチにゃん♪
    `imperium` は最初のカンマ區切り部分（"raise"/"embed" 等）、
    `args` は殘りの引數配列、`stx` は元の構文ノードにゃ -/
def expandeEventum (imperium : String) (args : Array Lean.Syntax) (stx : Lean.Syntax)
    : TermElabM (Option (TSyntax `term)) := do
  match imperium with

  -- ────────────────────────────────────────────────
  --  raise — 事象發生にゃん
  -- ────────────────────────────────────────────────

  | "raise" =>
    if h : args.size ≥ 1 then
      let cb := args[0]'(by omega)
      let res ← resolveCallbackum cb (args.size - 1)
      some <$> res.cumActione fun evStx paramTypes => do
        if args.size == 1 then
          `(Signaculum.Sakura.Systema.excita $evStx)
        else
          let refArgs ← Signaculum.toRefCumTypo (args.extract 1 args.size) paramTypes
          `(Signaculum.Sakura.Systema.excita $evStx [$refArgs,*])
    else throwErrorAt stx "\\![raise,...]: 引數が不足してゐますにゃ"

  -- ────────────────────────────────────────────────
  --  embed — 結果埋込にゃん
  -- ────────────────────────────────────────────────

  | "embed" =>
    if h : args.size ≥ 1 then
      let cb := args[0]'(by omega)
      let res ← resolveCallbackum cb (args.size - 1)
      some <$> res.cumActione fun evStx paramTypes => do
        if args.size == 1 then
          `(Signaculum.Sakura.Systema.insere $evStx)
        else
          let refArgs ← Signaculum.toRefCumTypo (args.extract 1 args.size) paramTypes
          `(Signaculum.Sakura.Systema.insere $evStx [$refArgs,*])
    else throwErrorAt stx "\\![embed,...]: 引數が不足してゐますにゃ"

  -- ────────────────────────────────────────────────
  --  notify — 通知にゃん
  -- ────────────────────────────────────────────────

  | "notify" =>
    if h : args.size ≥ 1 then
      let cb := args[0]'(by omega)
      let res ← resolveCallbackum cb (args.size - 1)
      some <$> res.cumActione fun evStx paramTypes => do
        if args.size == 1 then
          `(Signaculum.Sakura.Systema.notifica $evStx)
        else
          let refArgs ← Signaculum.toRefCumTypo (args.extract 1 args.size) paramTypes
          `(Signaculum.Sakura.Systema.notifica $evStx [$refArgs,*])
    else throwErrorAt stx "\\![notify,...]: 引數が不足してゐますにゃ"

  -- ────────────────────────────────────────────────
  --  timerraise — 時限事象にゃん
  -- ────────────────────────────────────────────────

  | "timerraise" =>
    if h : args.size ≥ 3 then
      let ms  : TSyntax `term := ⟨args[0]'(by omega)⟩
      let rep : TSyntax `term := ⟨args[1]'(by omega)⟩
      let cb := args[2]'(by omega)
      let res ← resolveCallbackum cb (args.size - 3)
      some <$> res.cumActione fun evStx paramTypes => do
        if args.size == 3 then
          `(Signaculum.Sakura.Systema.excitaPostTempus $ms $rep $evStx)
        else
          let refArgs ← Signaculum.toRefCumTypo (args.extract 3 args.size) paramTypes
          `(Signaculum.Sakura.Systema.excitaPostTempus $ms $rep $evStx [$refArgs,*])
    else throwErrorAt stx "\\![timerraise,...]: ms, rep, f の3引數以上が必要にゃ"

  -- ────────────────────────────────────────────────
  --  timernotify — 時限通知にゃん
  -- ────────────────────────────────────────────────

  | "timernotify" =>
    if h : args.size ≥ 3 then
      let ms  : TSyntax `term := ⟨args[0]'(by omega)⟩
      let rep : TSyntax `term := ⟨args[1]'(by omega)⟩
      let cb := args[2]'(by omega)
      let res ← resolveCallbackum cb (args.size - 3)
      some <$> res.cumActione fun evStx paramTypes => do
        if args.size == 3 then
          `(Signaculum.Sakura.Systema.notificaPostTempus $ms $rep $evStx)
        else
          let refArgs ← Signaculum.toRefCumTypo (args.extract 3 args.size) paramTypes
          `(Signaculum.Sakura.Systema.notificaPostTempus $ms $rep $evStx [$refArgs,*])
    else throwErrorAt stx "\\![timernotify,...]: ms, rep, f の3引數以上が必要にゃ"

  -- ────────────────────────────────────────────────
  --  raiseother — 他ゴースト事象にゃん
  -- ────────────────────────────────────────────────

  | "raiseother" =>
    if args.size < 2 then
      throwErrorAt stx "\\![raiseother,...]: ghost, event の2引數が必要にゃ"
    let g ← expectaStrLit args[0]! "\\![raiseother]"
    let e ← expectaStrLit args[1]! "\\![raiseother]"
    pure <| some (← `(Signaculum.Sakura.Systema.excitaAlium $g $e))

  -- ────────────────────────────────────────────────
  --  notifyother — 他ゴースト通知にゃん
  -- ────────────────────────────────────────────────

  | "notifyother" =>
    if args.size < 2 then
      throwErrorAt stx "\\![notifyother,...]: ghost, event の2引數が必要にゃ"
    let g ← expectaStrLit args[0]! "\\![notifyother]"
    let e ← expectaStrLit args[1]! "\\![notifyother]"
    pure <| some (← `(Signaculum.Sakura.Systema.notificaAlium $g $e))

  -- ────────────────────────────────────────────────
  --  timerraiseother — 時限他ゴースト事象にゃん
  -- ────────────────────────────────────────────────

  | "timerraiseother" =>
    if args.size < 4 then
      throwErrorAt stx "\\![timerraiseother,...]: ms, rep, ghost, event の4引數が必要にゃ"
    let ms  : TSyntax `term := ⟨args[0]!⟩
    let rep : TSyntax `term := ⟨args[1]!⟩
    let g ← expectaStrLit args[2]! "\\![timerraiseother]"
    let e ← expectaStrLit args[3]! "\\![timerraiseother]"
    pure <| some (← `(Signaculum.Sakura.Systema.excitaAliumPostTempus $ms $rep $g $e))

  -- ────────────────────────────────────────────────
  --  timernotifyother — 時限他ゴースト通知にゃん
  -- ────────────────────────────────────────────────

  | "timernotifyother" =>
    if args.size < 4 then
      throwErrorAt stx "\\![timernotifyother,...]: ms, rep, ghost, event の4引數が必要にゃ"
    let ms  : TSyntax `term := ⟨args[0]!⟩
    let rep : TSyntax `term := ⟨args[1]!⟩
    let g ← expectaStrLit args[2]! "\\![timernotifyother]"
    let e ← expectaStrLit args[3]! "\\![timernotifyother]"
    pure <| some (← `(Signaculum.Sakura.Systema.notificaAliumPostTempus $ms $rep $g $e))

  -- ────────────────────────────────────────────────
  --  raiseplugin — プラグイン事象にゃん
  -- ────────────────────────────────────────────────

  | "raiseplugin" =>
    if args.size < 2 then
      throwErrorAt stx "\\![raiseplugin,...]: plugin, event の2引數が必要にゃ"
    let p ← expectaStrLit args[0]! "\\![raiseplugin]"
    let e ← expectaStrLit args[1]! "\\![raiseplugin]"
    pure <| some (← `(Signaculum.Sakura.Systema.vocaPlugin $p $e))

  -- ────────────────────────────────────────────────
  --  notifyplugin — プラグイン通知にゃん
  -- ────────────────────────────────────────────────

  | "notifyplugin" =>
    if args.size < 2 then
      throwErrorAt stx "\\![notifyplugin,...]: plugin, event の2引數が必要にゃ"
    let p ← expectaStrLit args[0]! "\\![notifyplugin]"
    let e ← expectaStrLit args[1]! "\\![notifyplugin]"
    pure <| some (← `(Signaculum.Sakura.Systema.notificaPlugin $p $e))

  -- ────────────────────────────────────────────────
  --  timerraiseplugin — 時限プラグイン事象にゃん
  -- ────────────────────────────────────────────────

  | "timerraiseplugin" =>
    if args.size < 4 then
      throwErrorAt stx "\\![timerraiseplugin,...]: ms, rep, plugin, event の4引數が必要にゃ"
    let ms  : TSyntax `term := ⟨args[0]!⟩
    let rep : TSyntax `term := ⟨args[1]!⟩
    let p ← expectaStrLit args[2]! "\\![timerraiseplugin]"
    let e ← expectaStrLit args[3]! "\\![timerraiseplugin]"
    pure <| some (← `(Signaculum.Sakura.Systema.excitaPluginPostTempus $ms $rep $p $e))

  -- ────────────────────────────────────────────────
  --  timernotifyplugin — 時限プラグイン通知にゃん
  -- ────────────────────────────────────────────────

  | "timernotifyplugin" =>
    if args.size < 4 then
      throwErrorAt stx "\\![timernotifyplugin,...]: ms, rep, plugin, event の4引數が必要にゃ"
    let ms  : TSyntax `term := ⟨args[0]!⟩
    let rep : TSyntax `term := ⟨args[1]!⟩
    let p ← expectaStrLit args[2]! "\\![timernotifyplugin]"
    let e ← expectaStrLit args[3]! "\\![timernotifyplugin]"
    pure <| some (← `(Signaculum.Sakura.Systema.notificaPluginPostTempus $ms $rep $p $e))

  -- ────────────────────────────────────────────────
  --  async — 非同期實行にゃん
  -- ────────────────────────────────────────────────

  | "async" =>
    if args.size < 1 then
      throwErrorAt stx "\\![async,...]: term が1つ必要にゃ"
    let app : TSyntax `term := ⟨args[0]!⟩
    pure <| some (← `(liftM (Signaculum.Nucleus.spawnaMunitus do
        let _st ← Signaculum.Sakura.currere $app
        Signaculum.Sstp.mitteSstpScriptum (Signaculum.Sakura.adCatenamLista _st.scriptum))))

  | _ => pure none

end Signaculum.Notatio.Expande.Systema
