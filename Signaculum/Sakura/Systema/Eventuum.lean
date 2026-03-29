-- Signaculum.Sakura.Systema.Eventuum
-- 事象關數にゃん♪

import Signaculum.Sakura.Fundamentum

namespace Signaculum.Sakura.Systema

-- ════════════════════════════════════════════════════
--  事象 (Eventum)
-- ════════════════════════════════════════════════════

/-- 事象を發生させる（\\![raise,event,r0,...]）にゃん -/
def excita {m : Type → Type} [Monad m]
    (eventum : String) (citationes : List String := []) : SakuraM m Unit :=
  emitte (.eventuum (.excita eventum citationes))

/-- 事象の結果をその場に埋め込む（\\![embed,event,r0,...]）にゃん -/
def insere {m : Type → Type} [Monad m]
    (eventum : String) (citationes : List String := []) : SakuraM m Unit :=
  emitte (.eventuum (.insere eventum citationes))

/-- 通知事象（\\![notify,event,r0,...]）にゃん -/
def notifica {m : Type → Type} [Monad m]
    (eventum : String) (citationes : List String := []) : SakuraM m Unit :=
  emitte (.eventuum (.notifica eventum citationes))

-- ════════════════════════════════════════════════════
--  呼出し (Vocatio) — SHIORI/SAORI/プラグイン呼出し
-- ════════════════════════════════════════════════════

/-- SHIORI イベントを呼び出すにゃん（\\![call,shiori,eventum,r0,...]）。
    eventum に呼び出すイベント名、citationes に参照引数を渡すにゃ -/
def vocaShiori {m : Type → Type} [Monad m]
    (eventum : String) (citationes : List String := []) : SakuraM m Unit :=
  emitte (.eventuum (.vocaShiori eventum citationes))

/-- SAORI を呼び出すにゃん（\\![call,saori,dll,functio,r0,...]）。
    dllPath に DLL パス、functio に関数名、citationes に参照引数を渡すにゃ -/
def vocaSaori {m : Type → Type} [Monad m]
    (dllPath functio : String) (citationes : List String := []) : SakuraM m Unit :=
  emitte (.eventuum (.vocaSaori dllPath functio citationes))

/-- プラグインにイベントを送るにゃん（\\![raiseplugin,pluginNomen,eventum,r0,...]）。
    SSP 固有にゃん -/
def vocaPlugin {m : Type → Type} [Monad m]
    (pluginNomen eventum : String) (citationes : List String := []) : SakuraM m Unit :=
  emitte (.eventuum (.vocaPlugin pluginNomen eventum citationes))

-- ════════════════════════════════════════════════════
--  事象拡張 (Extensio Eventuum)
-- ════════════════════════════════════════════════════

/-- 時刻同期を實行するにゃん（\\6）-/
def syncTempus {m : Type → Type} [Monad m] : SakuraM m Unit := emitte (.imperii .syncTempus)

/-- 時刻同期事象を開始するにゃん（\\7）-/
def eventumTempus {m : Type → Type} [Monad m] : SakuraM m Unit := emitte (.imperii .eventumTempus)

/-- 一定時間後に事象を發生させるにゃん（\\![timerraise,ms,repeat,event,r0,...]）。
    repetitio は繰返し回數（0=無限）にゃ -/
def excitaPostTempus {m : Type → Type} [Monad m]
    (tempus repetitio : Nat) (eventum : String)
    (citationes : List String := []) : SakuraM m Unit :=
  emitte (.eventuum (.excitaPostTempus tempus repetitio eventum citationes))

/-- 他ゴーストに事象を發生させるにゃん（\\![raiseother,ghost,event,r0,...]）-/
def excitaAlium {m : Type → Type} [Monad m]
    (ghostNomen eventum : String)
    (citationes : List String := []) : SakuraM m Unit :=
  emitte (.eventuum (.excitaAlium ghostNomen eventum citationes))

/-- 一定時間後に他ゴーストの事象を發生させるにゃん（\\![timerraiseother,ms,repeat,ghost,event,r0,...]）-/
def excitaAliumPostTempus {m : Type → Type} [Monad m]
    (tempus repetitio : Nat) (ghostNomen eventum : String)
    (citationes : List String := []) : SakuraM m Unit :=
  emitte (.eventuum (.excitaAliumPostTempus tempus repetitio ghostNomen eventum citationes))

/-- 一定時間後に通知事象を發生させるにゃん（\\![timernotify,ms,repeat,event,r0,...]）-/
def notificaPostTempus {m : Type → Type} [Monad m]
    (tempus repetitio : Nat) (eventum : String)
    (citationes : List String := []) : SakuraM m Unit :=
  emitte (.eventuum (.notificaPostTempus tempus repetitio eventum citationes))

/-- 他ゴーストに通知事象を發生させるにゃん（\\![notifyother,ghost,event,r0,...]）-/
def notificaAlium {m : Type → Type} [Monad m]
    (ghostNomen eventum : String)
    (citationes : List String := []) : SakuraM m Unit :=
  emitte (.eventuum (.notificaAlium ghostNomen eventum citationes))

/-- 一定時間後に他ゴーストに通知するにゃん（\\![timernotifyother,ms,repeat,ghost,event,r0,...]）-/
def notificaAliumPostTempus {m : Type → Type} [Monad m]
    (tempus repetitio : Nat) (ghostNomen eventum : String)
    (citationes : List String := []) : SakuraM m Unit :=
  emitte (.eventuum (.notificaAliumPostTempus tempus repetitio ghostNomen eventum citationes))

/-- プラグインに通知事象を發生させるにゃん（\\![notifyplugin,plugin,event,r0,...]）-/
def notificaPlugin {m : Type → Type} [Monad m]
    (pluginNomen eventum : String)
    (citationes : List String := []) : SakuraM m Unit :=
  emitte (.eventuum (.notificaPlugin pluginNomen eventum citationes))

/-- 一定時間後にプラグインの事象を發生させるにゃん（\\![timerraiseplugin,ms,repeat,plugin,event,r0,...]）-/
def excitaPluginPostTempus {m : Type → Type} [Monad m]
    (tempus repetitio : Nat) (pluginNomen eventum : String)
    (citationes : List String := []) : SakuraM m Unit :=
  emitte (.eventuum (.excitaPluginPostTempus tempus repetitio pluginNomen eventum citationes))

/-- 一定時間後にプラグインに通知するにゃん（\\![timernotifyplugin,ms,repeat,plugin,event,r0,...]）-/
def notificaPluginPostTempus {m : Type → Type} [Monad m]
    (tempus repetitio : Nat) (pluginNomen eventum : String)
    (citationes : List String := []) : SakuraM m Unit :=
  emitte (.eventuum (.notificaPluginPostTempus tempus repetitio pluginNomen eventum citationes))

-- ════════════════════════════════════════════════════
--  ゴースト呼出し (Vocatio Ghostis)
-- ════════════════════════════════════════════════════

/-- ゴーストを呼び出すにゃん（\\![call,ghost,name,options]）。
    change と違って自ゴーストは終了しにゃいにゃ -/
def vocaGhost {m : Type → Type} [Monad m]
    (nomen : String) (optiones : OptionesMutationis := {}) : SakuraM m Unit :=
  emitte (.eventuum (.vocaGhost nomen optiones))

end Signaculum.Sakura.Systema
