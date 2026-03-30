-- Signaculum.Elementa.Lemma
-- シグナークルムの補題置き場にゃん♪
-- 既存型の補題は LemmaGeneralis プロイェクトゥムに移動してゐるにゃ

import Signaculum.Elementa.Axiom
import Signaculum.Sakura.Typi

namespace Signaculum.Elementa

open Signaculum.Sakura

-- ═══════════════════════════════════════════════════════════
-- 遁走函數の全稱安全性にゃん♪
-- String.foldl の歸納法が必要で今は證明できにゃいから sorry にゃ
-- ═══════════════════════════════════════════════════════════

/-- evadeTextus の出力中、各 ']' の直前には必ず '\\' があるにゃん。
    つまり生の（遁走されてゐにゃい）']' は存在しにゃいにゃ♪ -/
theorem theoremaEvadeTextusNullumCrudumClausum : ∀ (s : String),
  ∀ (i : Nat), (hi : i < (evadeTextus s).toList.length) →
    (evadeTextus s).toList[i] = ']' →
    (0 < i ∧ ∃ (hj : i - 1 < (evadeTextus s).toList.length),
      (evadeTextus s).toList[i - 1] = '\\') := by
  sorry

/-- evadeTextus の出力中、各 '%' の直前には必ず '\\' があるにゃん♪ -/
theorem theoremaEvadeTextusNullumCrudumPercentum : ∀ (s : String),
  ∀ (i : Nat), (hi : i < (evadeTextus s).toList.length) →
    (evadeTextus s).toList[i] = '%' →
    (0 < i ∧ ∃ (hj : i - 1 < (evadeTextus s).toList.length),
      (evadeTextus s).toList[i - 1] = '\\') := by
  sorry

end Signaculum.Elementa
