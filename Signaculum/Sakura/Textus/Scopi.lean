-- Signaculum.Sakura.Textus.Scopi
-- 範圍制御（誰が喋るか）にゃん♪

import Signaculum.Sakura.Fundamentum

namespace Signaculum.Sakura.Textus

-- ════════════════════════════════════════════════════
--  範圍制御 (Imperium Scopi) — 誰が喋るか
-- ════════════════════════════════════════════════════

/-- 主人格（\\h / \\0）に切り替へるにゃん -/
def sakura {m : Type → Type} [Monad m] : SakuraM m Unit := emitte (.scopi .sakura)

/-- 副人格（\\u / \\1）に切り替へるにゃん -/
def kero {m : Type → Type} [Monad m] : SakuraM m Unit := emitte (.scopi .kero)

/-- 第 n 人格（\\p[n]）に切り替へるにゃん -/
def persona {m : Type → Type} [Monad m] (n : Nat) : SakuraM m Unit :=
  emitte (.scopi (.persona n))

end Signaculum.Sakura.Textus
