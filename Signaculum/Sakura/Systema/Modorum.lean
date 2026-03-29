-- Signaculum.Sakura.Systema.Modorum
-- モード制御・同期拡張・壁紙設定關數にゃん♪

import Signaculum.Sakura.Fundamentum

namespace Signaculum.Sakura.Systema

-- ════════════════════════════════════════════════════
--  モード制御 (Imperium Modorum)
-- ════════════════════════════════════════════════════

/-- オンラインモードに入るにゃん（\\![enter,onlinemode]）-/
def ingredereModumOnline {m : Type → Type} [Monad m] : SakuraM m Unit :=
  emitte (.modorum .ingredereModumOnline)

/-- オンラインモードから出るにゃん（\\![leave,onlinemode]）-/
def egrediereModumOnline {m : Type → Type} [Monad m] : SakuraM m Unit :=
  emitte (.modorum .egrediereModumOnline)

/-- ユーザー中断禁止モードに入るにゃん（\\![enter,nouserbreakmode]）-/
def ingredereModumNonInterruptum {m : Type → Type} [Monad m] : SakuraM m Unit :=
  emitte (.modorum .ingredereModumNonInterruptum)

/-- ユーザー中断禁止モードから出るにゃん（\\![leave,nouserbreakmode]）-/
def egrediereModumNonInterruptum {m : Type → Type} [Monad m] : SakuraM m Unit :=
  emitte (.modorum .egrediereModumNonInterruptum)

-- ════════════════════════════════════════════════════
--  同期拡張 (Extensio Synchroniae)
-- ════════════════════════════════════════════════════

/-- 特定スコープのみ同期するにゃん（\\_s[ID1,ID2,...]）-/
def synchronaScopi {m : Type → Type} [Monad m] (scopiId : List Nat) : SakuraM m Unit :=
  emitte (.imperii (.synchronaScopi scopiId))

/-- 同期タイマーをリセットするにゃん（\\__w[clear]）-/
def reseraTimerSynchrinae {m : Type → Type} [Monad m] : SakuraM m Unit :=
  emitte (.morae .reseraTimerSynchrinae)

/-- 特定アニメーションの完了を待つにゃん（\\__w[animation,id]）-/
def moraAnimationem {m : Type → Type} [Monad m] (animId : Nat) : SakuraM m Unit :=
  emitte (.morae (.moraAnimationem animId))

/-- クイックセクションの有效/無效を設定するにゃん（\\![quicksection,true/false]）。
    `celer`（\\_q）のブール版にゃ -/
def sectionCeler {m : Type → Type} [Monad m] (b : Bool) : SakuraM m Unit :=
  emitte (.imperii (.sectionCeler b))

/-- 次のゴーストに順番に切り替へるにゃん（\\_+）-/
def mutaGhostSequens {m : Type → Type} [Monad m] : SakuraM m Unit := emitte (.imperii .mutaGhostSequens)

/-- 常に最前面トグル（\\v）にゃん -/
def togglaSupra {m : Type → Type} [Monad m] : SakuraM m Unit := emitte (.imperii .togglaSupra)

-- ════════════════════════════════════════════════════
--  壁紙設定 (Configuratio Tapetis)
-- ════════════════════════════════════════════════════

/-- 壁紙を設定するにゃん（\\![set,wallpaper,file,option]）。
    optio: `center`/`tile`/`stretch`/`stretch-x`/`stretch-y`/`span` にゃ -/
def configuraTapete {m : Type → Type} [Monad m]
    (via : String) (optio : Option ModusTapetis := none) : SakuraM m Unit :=
  emitte (.fenestrae (.configuraTapete via optio))

end Signaculum.Sakura.Systema
