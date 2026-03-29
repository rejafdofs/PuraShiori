-- Signaculum.Sakura.Textus.Superficiei
-- 表面制御（表情）にゃん♪

import Signaculum.Sakura.Fundamentum

namespace Signaculum.Sakura.Textus

-- ════════════════════════════════════════════════════
--  表面制御 (Imperium Superficiei) — 表情
-- ════════════════════════════════════════════════════

/-- 表面 ID を設定する（\\s[n]）にゃん -/
def superficies {m : Type → Type} [Monad m] (n : Nat) : SakuraM m Unit :=
  emitte (.superficiei (.superficies n))

/-- 表面 動畫を再生する（\\i[n]）にゃん -/
def animatio {m : Type → Type} [Monad m] (n : Nat) : SakuraM m Unit :=
  emitte (.superficiei (.animatio n))

end Signaculum.Sakura.Textus
