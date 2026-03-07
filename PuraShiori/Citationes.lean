-- PuraShiori.Citationes
-- SHIORI Reference の型安全な相互変換クラスにゃん♪
-- fromRef (toRef a) = a が型クラスの法則として保証されるにゃ

import PuraShiori.Lemma
import Aesop
namespace PuraShiori

/-- 値を SHIORI Reference 文字列に変換し、逆変換も保証される型クラスにゃん。
    `toRef` で直列化・`fromRef` で復元。
    `roundtrip : ∀ a, fromRef (toRef a) = a` が法則として要求されるにゃ。
    `insere`/`excita` の引數変換と、処理器ラッパーの Reference 復元に使ふにゃ -/
class Citatio (α : Type) where
  toRef     : α → String
  fromRef   : String → α
  roundtrip : ∀ (a : α), fromRef (toRef a) = a

-- ═══════════════════════════════════════════════════
-- 基本型のインスタンスにゃん
-- ═══════════════════════════════════════════════════

instance : Citatio String where
  toRef s     := s
  fromRef s   := s
  roundtrip _ := rfl

instance : Citatio Bool where
  toRef b   := if b then "true" else "false"
  fromRef s := s == "true"
  roundtrip b := by cases b <;> rfl

instance : Citatio Nat where
  toRef n   := toString n
  fromRef s := s.toNat?.getD 0
  roundtrip n := by
    show (toString n).toNat?.getD 0 = n
    simp [Nat.toNat?_repr]

instance : Citatio Int where
  toRef n   := toString n
  fromRef s := s.toInt?.getD 0
  roundtrip n := by
    show (toString n).toInt?.getD 0 = n
    simp [Int.toInt?_toString]

-- Char: String.data パターンマッチで往復するにゃ（rfl で証明可能）
instance : Citatio Char where
  toRef c   := String.singleton c
  fromRef s := match s.toList with
    | c :: _ => c
    | []     => ' '
  roundtrip c := by
    change (match (String.singleton c).toList with
      | c' :: _ => c'
      | []      => ' ') = c
    simp

-- UInt8: 十進数文字列にゃ
instance : Citatio UInt8 where
  toRef n   := toString n.toNat
  fromRef s := UInt8.ofNat (s.toNat?.getD 0)
  roundtrip n := by
    show UInt8.ofNat ((toString n.toNat).toNat?.getD 0) = n
    have h1 : (toString n.toNat).toNat?.getD 0 = n.toNat := by
      simp [Nat.toNat?_repr]
    rw [h1]; exact UInt8.ofNat_toNat

-- UInt16: 十進数文字列にゃ
instance : Citatio UInt16 where
  toRef n   := toString n.toNat
  fromRef s := UInt16.ofNat (s.toNat?.getD 0)
  roundtrip n := by
    show UInt16.ofNat ((toString n.toNat).toNat?.getD 0) = n
    have h1 : (toString n.toNat).toNat?.getD 0 = n.toNat := by
      simp [Nat.toNat?_repr]
    rw [h1]; exact UInt16.ofNat_toNat

-- UInt32: 十進数文字列にゃ
instance : Citatio UInt32 where
  toRef n   := toString n.toNat
  fromRef s := UInt32.ofNat (s.toNat?.getD 0)
  roundtrip n := by
    show UInt32.ofNat ((toString n.toNat).toNat?.getD 0) = n
    have h1 : (toString n.toNat).toNat?.getD 0 = n.toNat := by
      simp [Nat.toNat?_repr]
    rw [h1]; exact UInt32.ofNat_toNat

-- UInt64: 十進数文字列にゃ
instance : Citatio UInt64 where
  toRef n   := toString n.toNat
  fromRef s := UInt64.ofNat (s.toNat?.getD 0)
  roundtrip n := by
    show UInt64.ofNat ((toString n.toNat).toNat?.getD 0) = n
    have h1 : (toString n.toNat).toNat?.getD 0 = n.toNat := by
      simp [Nat.toNat?_repr]
    rw [h1]; exact UInt64.ofNat_toNat

-- ═══════════════════════════════════════════════════
-- 複合型のインスタンスにゃん
-- ═══════════════════════════════════════════════════

/-- Option α: none → ""、some a → "1" ++ toRef a
    fromRef は String.data パターンマッチで実装するにゃ。
    これにより startsWith の証明問題を回避できるにゃん。 -/
instance {α : Type} [inst : Citatio α] : Citatio (Option α) where
  toRef
    | none   => ""
    | some a => "1" ++ inst.toRef a
  fromRef s := match s.toList with
    | '1' :: rest => some (inst.fromRef (String.ofList rest))
    | _           => none
  roundtrip
    | none   => rfl
    | some a => by
        show (match ("1" ++ inst.toRef a).toList with
              | '1' :: rest => some (inst.fromRef (String.ofList rest))
              | _           => none) = some a
        simp [inst.roundtrip]

/-- α × β: 長さプレフィクス形式にゃ。
    `toRef (a, b) = Nat.repr (toRef a).length ++ ":" ++ toRef a ++ toRef b`
    `fromRef` は `String.data.span Char.isDigit` で長さを解析するにゃ。
    Nat.repr の文字はすべて digit なので最初の `:` が確実に区切りになるにゃ -/
instance {α β : Type} [Citatio α] [Citatio β] : Citatio (α × β) where
  toRef  :=fun ⟨a, b⟩=>
    let sa := Citatio.toRef a
    Nat.repr sa.length ++ ":" ++ sa ++ Citatio.toRef b
  fromRef s :=
    let (digits, rest) := s.toList.span Char.isDigit
    match rest with
    | ':' :: afterColon =>
      match (String.ofList digits).toNat? with
      | none   => (Citatio.fromRef "", Citatio.fromRef "")
      | some n =>
          (Citatio.fromRef (String.ofList (afterColon.take n)),
           Citatio.fromRef (String.ofList (afterColon.drop n)))
    | _ => (Citatio.fromRef "", Citatio.fromRef "")
  roundtrip p := by
    rcases p with ⟨a, b⟩
    simp only []
    -- span の計算にゃん
    have hspan : ((Nat.repr (Citatio.toRef a).length ++ ":" ++ Citatio.toRef a ++ Citatio.toRef b).toList.span Char.isDigit) =
        ((Nat.repr (Citatio.toRef a).length).toList, ':' :: (Citatio.toRef a ++ Citatio.toRef b).toList) := by
      simp only [String.toList_append, show (":" : String).toList = [':'] from rfl]
      rw [show (Nat.repr (Citatio.toRef a).length).toList ++ [':'] ++ (Citatio.toRef a).toList ++ (Citatio.toRef b).toList =
          (Nat.repr (Citatio.toRef a).length).toList ++ [':'] ++ ((Citatio.toRef a).toList ++ (Citatio.toRef b).toList) from by
        simp [List.append_assoc]]
      rw [List.span_isDigit_repr]; rfl
    rw [hspan, String.ofList_toList, Nat.toNat?_repr]
    simp only []
    -- take / drop にゃん
    have htake : ((Citatio.toRef a ++ Citatio.toRef b).toList.take (Citatio.toRef a).length) =
        (Citatio.toRef a).toList := by
      rw [String.toList_append]
      have h : (Citatio.toRef a).length = (Citatio.toRef a).toList.length := String.length_toList.symm
      rw [List.take_append_of_le_length (by omega), h, List.take_length]
    have hdrop : ((Citatio.toRef a ++ Citatio.toRef b).toList.drop (Citatio.toRef a).length) =
        (Citatio.toRef b).toList := by
      rw [String.toList_append]
      have h : (Citatio.toRef a).length = (Citatio.toRef a).toList.length := String.length_toList.symm
      rw [List.drop_append_of_le_length (by omega), h, List.drop_length]; simp
    rw [htake, hdrop, String.ofList_toList, String.ofList_toList]
    simp [Citatio.roundtrip]

end PuraShiori
