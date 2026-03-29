-- Signaculum.Sakura.Textus.Morae
-- 待機・テンポ制御關數にゃん♪

import Signaculum.Sakura.Fundamentum

namespace Signaculum.Sakura.Textus

-- ════════════════════════════════════════════════════
--  待機 (Mora) — テンポ制御
-- ════════════════════════════════════════════════════

/-- ミリ秒待機（\\_w[ms]）にゃん -/
def mora {m : Type → Type} [Monad m] (ms : Nat) : SakuraM m Unit :=
  emitte (.morae (.mora ms))

/-- 簡易待機（\\w[1-9]、50ms × n）にゃん -/
def moraCeler {m : Type → Type} [Monad m] (n : Nat) (_h : 1 ≤ n ∧ n ≤ 9 := by omega) : SakuraM m Unit :=
  emitte (.morae (.moraCeler n _h))

/-- 絕對時間待機（\\__w[ms]）にゃん -/
def moraAbsoluta {m : Type → Type} [Monad m] (ms : Nat) : SakuraM m Unit :=
  emitte (.morae (.moraAbsoluta ms))

/-- 打鍵待ち（\\x）にゃん -/
def expecta {m : Type → Type} [Monad m] : SakuraM m Unit := emitte (.morae .expecta)

/-- 打鍵待ち・淸掃にゃし（\\x[noclear]）にゃん -/
def expectaSine {m : Type → Type} [Monad m] : SakuraM m Unit :=
  emitte (.morae .expectaSine)

/-- 時間制約區劃（\\t）にゃん -/
def tempusCriticum {m : Type → Type} [Monad m] : SakuraM m Unit :=
  emitte (.imperii .tempusCriticum)

end Signaculum.Sakura.Textus
