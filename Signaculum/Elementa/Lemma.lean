-- Signaculum.Elementa.Lemma
-- シグナークルムの補題置き場にゃん♪
-- 既存型の補題は LemmaGeneralis プロイェクトゥムに移動してゐるにゃ

import Signaculum.Elementa.Axiom
import Signaculum.Sakura.Typi

namespace Signaculum.Elementa

open Signaculum.Sakura

-- ═══════════════════════════════════════════════════════════
-- 遁走函數の補助定義にゃん♪
-- ═══════════════════════════════════════════════════════════

-- 一文字づつの遁走結果をリストゥムで返すにゃ
private def evadeChar (c : Char) : List Char :=
  match c with
  | '\\' => ['\\']
  | '%'  => ['\\', '%']
  | ']'  => ['\\', ']']
  | c    => [c]

-- String 上の foldl ステップスにゃん♪
private def evadeStep (acc : String) (c : Char) : String :=
  match c with
  | '\\' => acc ++ "\\"
  | '%'  => acc ++ "\\%"
  | ']'  => acc ++ "\\]"
  | _    => acc.push c

-- 「target の各出現の直前に '\\' がある」といふ述語にゃ
private def praedicatumPraecedit (target : Char) (cs : List Char) : Prop :=
  ∀ (i : Nat), (hi : i < cs.length) → cs[i] = target →
    (0 < i ∧ ∃ (hj : i - 1 < cs.length), cs[i - 1] = '\\')

-- ═══════════════════════════════════════════════════════════
-- String.foldl → List.foldl の橋渡しにゃん♪
-- ═══════════════════════════════════════════════════════════

private theorem String_foldl_toList_eq {α : Type _} (f : α → Char → α) (init : α)
    (s : String) : s.foldl f init = s.toList.foldl f init := by
  simp only [String.foldl, String.Slice.foldl]
  rw [← Std.Iter.foldl_toList, String.Slice.toList_chars]
  suffices h : s.toSlice.copy = s by rw [h]
  have hba : s.toByteArray.extract 0 s.utf8ByteSize = s.toByteArray := by
    show s.toByteArray.extract 0 s.toByteArray.size = s.toByteArray
    exact ByteArray.extract_zero_size
  simp only [String.Slice.copy, String.toSlice, String.startPos, String.endPos, String.extract]
  exact String.ext (by simp [String.toList, hba])

-- evadeStep の toList はアックムラートルに evadeChar を連結するのと同じにゃ
private theorem evadeStep_toList (acc : String) (c : Char) :
    (evadeStep acc c).toList = acc.toList ++ evadeChar c := by
  simp only [evadeStep, evadeChar]
  split <;> simp [String.toList_append, String.toList_push]

-- foldl evadeStep の toList = flatMap evadeChar にゃ
private theorem foldl_evadeStep_toList (acc : String) (cs : List Char) :
    (cs.foldl evadeStep acc).toList = acc.toList ++ cs.flatMap evadeChar := by
  induction cs generalizing acc with
  | nil => simp
  | cons c cs ih =>
    simp only [List.foldl, List.flatMap_cons]
    rw [ih (evadeStep acc c), evadeStep_toList]
    simp [List.append_assoc]

-- evadeTextus の toList は flatMap evadeChar と等しいにゃん♪
private theorem evadeTextus_toList_eq (s : String) :
    (evadeTextus s).toList = s.toList.flatMap evadeChar := by
  have : evadeTextus s = s.toList.foldl evadeStep "" := by
    unfold evadeTextus; rw [String_foldl_toList_eq]; rfl
  rw [this, foldl_evadeStep_toList]; simp

-- ═══════════════════════════════════════════════════════════
-- 不變條件の保存證明にゃん♪
-- ═══════════════════════════════════════════════════════════

-- 各チャンクス内で述語が成り立つにゃ
private theorem evadeChar_praedicatum (c target : Char) (htne : target ≠ '\\')
    (ht : target = '%' ∨ target = ']') : praedicatumPraecedit target (evadeChar c) := by
  simp only [evadeChar, praedicatumPraecedit]; split
  · intro i hi heq; simp at hi; subst hi; simp at heq; exact absurd heq.symm htne
  · intro i hi heq; simp at hi
    rcases (by omega : i = 0 ∨ i = 1) with rfl | rfl
    · simp at heq; exact absurd heq.symm htne
    · exact ⟨by omega, ⟨by omega, by simp⟩⟩
  · intro i hi heq; simp at hi
    rcases (by omega : i = 0 ∨ i = 1) with rfl | rfl
    · simp at heq; exact absurd heq.symm htne
    · exact ⟨by omega, ⟨by omega, by simp⟩⟩
  · rename_i hc1 hc2 hc3; intro i hi heq; simp at hi; subst hi; simp at heq
    rcases ht with rfl | rfl
    · exact absurd heq hc2
    · exact absurd heq hc3

-- flatMap の先頭が target でにゃいことの證明にゃ
private theorem flatMap_evadeChar_head_ne (target : Char) (cs : List Char)
    (htne : target ≠ '\\') (ht : target = '%' ∨ target = ']') :
    cs.flatMap evadeChar = [] ∨ ∀ (h : 0 < (cs.flatMap evadeChar).length),
      (cs.flatMap evadeChar)[0] ≠ target := by
  induction cs with
  | nil => left; simp
  | cons c cs _ =>
    right; intro _; simp only [List.flatMap_cons]
    have hne : 0 < (evadeChar c).length := by simp [evadeChar]; split <;> simp
    simp [hne]; simp only [evadeChar]; split
    · exact htne.symm
    · exact htne.symm
    · simp; exact htne.symm
    · rename_i hc1 hc2 hc3; simp
      rcases ht with rfl | rfl
      · exact hc2
      · exact hc3

-- 連結で述語が保存されるにゃん♪
private theorem praedicatum_append (target : Char) (xs ys : List Char)
    (hxs : praedicatumPraecedit target xs) (hys : praedicatumPraecedit target ys)
    (hhead : ys = [] ∨ ∀ (h : 0 < ys.length), ys[0] ≠ target) :
    praedicatumPraecedit target (xs ++ ys) := by
  intro i hi heq
  simp [List.getElem_append] at heq; split at heq
  case isTrue h =>
    have ⟨hpos, hj, hprev⟩ := hxs i h heq
    refine ⟨hpos, ⟨by simp; omega, ?_⟩⟩
    simp [show i - 1 < xs.length from by omega]; exact hprev
  case isFalse h =>
    by_cases hxl : i = xs.length
    · subst hxl
      rcases hhead with hemp | hh
      · subst hemp; simp at hi
      · have hyl : 0 < ys.length := by simp at hi; omega
        exfalso; exact hh hyl (by simp [Nat.sub_self] at heq; exact heq)
    · have hidx : i - xs.length < ys.length := by simp at hi; omega
      have ⟨_, hj, hprev⟩ := hys (i - xs.length) hidx heq
      refine ⟨by omega, ⟨by simp; omega, ?_⟩⟩
      rw [show (xs ++ ys)[i - 1] = if h' : i - 1 < xs.length then xs[i-1] else ys[i - 1 - xs.length]
        from List.getElem_append (by omega)]
      simp [show ¬(i - 1 < xs.length) from by omega,
            show i - 1 - xs.length = i - xs.length - 1 from by omega]
      exact hprev

-- flatMap evadeChar 全體で述語が成り立つにゃ（歸納法にゃん♪）
private theorem praedicatum_flatMap (target : Char) (cs : List Char)
    (htne : target ≠ '\\') (ht : target = '%' ∨ target = ']') :
    praedicatumPraecedit target (cs.flatMap evadeChar) := by
  induction cs with
  | nil => intro i hi; simp at hi
  | cons c cs ih =>
    simp only [List.flatMap_cons]
    exact praedicatum_append target (evadeChar c) (cs.flatMap evadeChar)
      (evadeChar_praedicatum c target htne ht) ih
      (flatMap_evadeChar_head_ne target cs htne ht)

-- ═══════════════════════════════════════════════════════════
-- 遁走函數の全稱安全性にゃん♪
-- ═══════════════════════════════════════════════════════════

/-- evadeTextus の出力中、各 ']' の直前には必ず '\\' があるにゃん。
    つまり生の（遁走されてゐにゃい）']' は存在しにゃいにゃ♪ -/
theorem theoremaEvadeTextusNullumCrudumClausum : ∀ (s : String),
  ∀ (i : Nat), (hi : i < (evadeTextus s).toList.length) →
    (evadeTextus s).toList[i] = ']' →
    (0 < i ∧ ∃ (hj : i - 1 < (evadeTextus s).toList.length),
      (evadeTextus s).toList[i - 1] = '\\') := by
  intro s; rw [evadeTextus_toList_eq]
  exact praedicatum_flatMap ']' s.toList (by decide) (Or.inr rfl)

/-- evadeTextus の出力中、各 '%' の直前には必ず '\\' があるにゃん♪ -/
theorem theoremaEvadeTextusNullumCrudumPercentum : ∀ (s : String),
  ∀ (i : Nat), (hi : i < (evadeTextus s).toList.length) →
    (evadeTextus s).toList[i] = '%' →
    (0 < i ∧ ∃ (hj : i - 1 < (evadeTextus s).toList.length),
      (evadeTextus s).toList[i - 1] = '\\') := by
  intro s; rw [evadeTextus_toList_eq]
  exact praedicatum_flatMap '%' s.toList (by decide) (Or.inl rfl)

end Signaculum.Elementa
