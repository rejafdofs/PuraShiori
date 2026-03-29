-- Signaculum.Sakura.Textus.Bullae
-- 吹出し關數にゃん♪

import Signaculum.Sakura.Fundamentum

namespace Signaculum.Sakura.Textus

-- ════════════════════════════════════════════════════
--  吹出し (Bulla)
-- ════════════════════════════════════════════════════

/-- 吹出し ID を變更する（\\b[n]）にゃん -/
def bulla {m : Type → Type} [Monad m] (n : Nat) : SakuraM m Unit :=
  emitte (.bullae (.bulla n))

/-- 吹出しに畫像を重ねる（\\_b[path,x,y]）にゃん -/
def imagoBullae {m : Type → Type} [Monad m]
    (via : String) (x y : Nat) : SakuraM m Unit :=
  emitte (.bullae (.imagoBullae via x y))

end Signaculum.Sakura.Textus
