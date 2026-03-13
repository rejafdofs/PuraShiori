-- LemmaGeneralis
-- 既存型に關する補題群にゃん♪ PuraShiori 固有の函數を含まぬ定理を集めたるにゃ

/-- String.Internal.append は String.append (++) と同等にゃん。
    兩者とも @[extern "lean_string_append"] で同じ C 實裝を使ふが、
    Internal.append は opaque で Lean カーネルに定義が見えないにゃ。
    Init.Data.String.Bootstrap に確認できるにゃ。 -/
axiom String.Internal.append_eq_append (s t : String) :
    String.Internal.append s t = s ++ t

/-- String は UTF-8 バイト列への往復が保証されるにゃ -/
theorem String.fromUTF8?_toUTF8 (s : String) : String.fromUTF8? s.toUTF8 = some s := by
  simp_all only [toUTF8_eq_toByteArray]
  have h := s.isValidUTF8
  rw [fromUTF8?]
  simp_all only [↓reduceDIte, Option.some.injEq]
  rfl

/-- n < 2^64 なら n.toUInt64.toNat = n にゃ -/
theorem Nat.toUInt64_toNat_of_lt {n : Nat} (h : n < 2^64) : n.toUInt64.toNat = n := by
  simp only [Nat.toUInt64, UInt64.toNat]
  exact Nat.mod_eq_of_lt h

set_option maxRecDepth 512 in
private theorem Nat.toDigitsCore_ne_nil (fuel : Nat) (n : Nat) (ds : List Char) :
    Nat.toDigitsCore 10 (fuel + 1) n ds ≠ [] := by
  induction fuel generalizing n ds with
  | zero =>
    simp only [Nat.toDigitsCore]
    split
    · exact List.cons_ne_nil _ _
    · exact List.cons_ne_nil _ _
  | succ fuel ih =>
    simp only [Nat.toDigitsCore]
    split
    · exact List.cons_ne_nil _ _
    · exact ih _ _

private theorem Nat.toDigits_ne_nil (n : Nat) :
    Nat.toDigits 10 n ≠ [] := by
  simp only [Nat.toDigits]
  exact Nat.toDigitsCore_ne_nil n n []

private theorem Nat.digitChar_isDigit (n : Nat) (h : n < 10) :
    (Nat.digitChar n).isDigit = true := by
  rcases n with _ | n; · native_decide
  rcases n with _ | n; · native_decide
  rcases n with _ | n; · native_decide
  rcases n with _ | n; · native_decide
  rcases n with _ | n; · native_decide
  rcases n with _ | n; · native_decide
  rcases n with _ | n; · native_decide
  rcases n with _ | n; · native_decide
  rcases n with _ | n; · native_decide
  rcases n with _ | n; · native_decide
  omega

set_option maxRecDepth 1024 in
private theorem Nat.toDigitsCore_isDigit (fuel : Nat) (n : Nat) (ds : List Char)
    (hds : ∀ c ∈ ds, c.isDigit) :
    ∀ c ∈ Nat.toDigitsCore 10 fuel n ds, c.isDigit := by
  induction fuel generalizing n ds with
  | zero =>
    simp [Nat.toDigitsCore]
    exact hds
  | succ fuel ih =>
    simp only [Nat.toDigitsCore]
    split
    · rename_i h
      intro c hc
      simp only [List.mem_cons] at hc
      rcases hc with rfl | hc
      · exact Nat.digitChar_isDigit _ (Nat.mod_lt n (by omega))
      · exact hds c hc
    · rename_i h
      apply ih
      intro c hc
      simp only [List.mem_cons] at hc
      rcases hc with rfl | hc
      · exact Nat.digitChar_isDigit _ (Nat.mod_lt n (by omega))
      · exact hds c hc

set_option maxRecDepth 512 in
private theorem List.span_loop_split {α : Type} (p : α → Bool) (xs : List α) (y : α) (ys : List α)
    (acc : List α) (hxs : ∀ x ∈ xs, p x = true) (hy : p y = false) :
    List.span.loop p (xs ++ y :: ys) acc = (acc.reverse ++ xs, y :: ys) := by
  induction xs generalizing acc with
  | nil =>
    simp only [List.nil_append, List.span.loop, hy, List.append_nil]
  | cons x xs ih =>
    have hx := hxs x (List.Mem.head xs)
    simp only [List.cons_append, List.span.loop, hx]
    rw [ih (x :: acc) (fun z hz => hxs z (List.Mem.tail x hz))]
    simp [List.reverse_cons, List.append_assoc]

private theorem Nat.digitChar_toNat_sub (k : Nat) (h : k < 10) :
    (Nat.digitChar k).toNat - '0'.toNat = k := by
  rcases k with _ | k; · native_decide
  rcases k with _ | k; · native_decide
  rcases k with _ | k; · native_decide
  rcases k with _ | k; · native_decide
  rcases k with _ | k; · native_decide
  rcases k with _ | k; · native_decide
  rcases k with _ | k; · native_decide
  rcases k with _ | k; · native_decide
  rcases k with _ | k; · native_decide
  rcases k with _ | k; · native_decide
  omega

private theorem Nat.digitChar_ne_underscore (k : Nat) (h : k < 10) :
    Nat.digitChar k ≠ '_' := by
  rcases k with _ | k; · native_decide
  rcases k with _ | k; · native_decide
  rcases k with _ | k; · native_decide
  rcases k with _ | k; · native_decide
  rcases k with _ | k; · native_decide
  rcases k with _ | k; · native_decide
  rcases k with _ | k; · native_decide
  rcases k with _ | k; · native_decide
  rcases k with _ | k; · native_decide
  rcases k with _ | k; · native_decide
  omega

set_option maxRecDepth 1024 in
private theorem Nat.toDigitsCore_append (fuel n : Nat) (ds : List Char) (h : n < fuel) :
    Nat.toDigitsCore 10 fuel n ds = Nat.toDigitsCore 10 fuel n [] ++ ds := by
  induction fuel generalizing n ds with
  | zero => omega
  | succ fuel ih =>
    simp only [Nat.toDigitsCore]; split
    · simp
    · rename_i hne
      have hdiv : n / 10 < fuel := by
        have := Nat.div_lt_self (by omega : 0 < n) (by omega : 1 < 10); omega
      rw [ih _ _ hdiv, ih _ [_] hdiv]; simp [List.append_assoc]

set_option maxRecDepth 1024 in
private theorem Nat.toDigitsCore_decode (fuel n : Nat) (h : n < fuel) :
    (Nat.toDigitsCore 10 fuel n []).foldl
      (fun acc c => if c = '_' then acc else acc * 10 + (c.toNat - '0'.toNat)) 0 = n := by
  induction fuel generalizing n with
  | zero => omega
  | succ fuel ih =>
    simp only [Nat.toDigitsCore]; split
    · rename_i heq
      simp only [List.foldl_cons, List.foldl_nil]
      have hnu := Nat.digitChar_ne_underscore (n % 10) (Nat.mod_lt n (by omega))
      simp only [if_neg hnu]
      rw [Nat.digitChar_toNat_sub (n % 10) (Nat.mod_lt n (by omega))]; omega
    · rename_i hne
      have hdiv : n / 10 < fuel := by
        have := Nat.div_lt_self (by omega : 0 < n) (by omega : 1 < 10); omega
      rw [Nat.toDigitsCore_append fuel (n / 10) [_] hdiv, List.foldl_append]
      have hnu := Nat.digitChar_ne_underscore (n % 10) (Nat.mod_lt n (by omega))
      simp only [List.foldl_cons, List.foldl_nil, if_neg hnu]
      rw [ih (n / 10) hdiv, Nat.digitChar_toNat_sub (n % 10) (Nat.mod_lt n (by omega))]
      exact Nat.div_add_mod' n 10

private theorem Nat.isNat_foldl_stable (l : List Char) (hl : ∀ x ∈ l, x.isDigit = true) :
    (l.foldl (fun (x : Bool × Bool × Bool × Bool) c =>
      (false, decide (c = '_'), c.isDigit,
       x.2.2.2 && (c.isDigit || decide (c = '_')) &&
       !(x.1 && decide (c = '_')) && !(x.2.1 && decide (c = '_'))))
     (false, false, true, true)).2.2.2 = true ∧
    (l.foldl (fun (x : Bool × Bool × Bool × Bool) c =>
      (false, decide (c = '_'), c.isDigit,
       x.2.2.2 && (c.isDigit || decide (c = '_')) &&
       !(x.1 && decide (c = '_')) && !(x.2.1 && decide (c = '_'))))
     (false, false, true, true)).2.2.1 = true := by
  induction l with
  | nil => simp
  | cons c cs ih =>
    have hc : c.isDigit = true := hl c (List.Mem.head cs)
    have hnu : ¬(c = '_') := fun h => by subst h; simp [Char.isDigit] at hc
    simp only [List.foldl_cons, hc, decide_eq_false_iff_not.mpr hnu,
               Bool.and_false, Bool.not_false, Bool.and_true, Bool.true_or, Bool.and_true]
    exact ih (fun x hx => hl x (List.Mem.tail c hx))

private theorem String.toSlice_copy_self (s : String) : s.toSlice.copy = s := by
  simp only [String.Slice.copy, String.toSlice, String.extract]
  apply String.toByteArray_inj.mp
  show s.toByteArray.extract (String.Pos.Raw.byteIdx 0) s.utf8ByteSize = s.toByteArray
  have h0 : String.Pos.Raw.byteIdx 0 = 0 := rfl
  rw [h0, ← String.size_toByteArray]; exact ByteArray.extract_zero_size

universe u_foldl in
private theorem String.Slice.foldl_toList_eq {α : Type u_foldl} (f : α → Char → α) (init : α)
    (s : String) : s.toSlice.foldl f init = s.toList.foldl f init := by
  simp only [String.Slice.foldl]
  rw [← Std.Iter.foldl_toList, String.Slice.toList_chars, String.toSlice_copy_self]

/-- Nat.repr は toNat? で往復するにゃ -/
theorem Nat.toNat?_repr (n : Nat) : (Nat.repr n).toNat? = some n := by
  simp only [String.toNat?, String.Slice.toNat?]
  have hisNat : (Nat.repr n).toSlice.isNat = true := by
    simp only [String.Slice.isNat]
    have hemp : (Nat.repr n).toSlice.isEmpty = false := by
      rw [String.isEmpty_toSlice, Bool.eq_false_iff]
      intro heq
      rw [String.isEmpty_iff, Nat.repr, String.ofList_eq_empty_iff, Nat.toDigits] at heq
      exact Nat.toDigitsCore_ne_nil n n [] heq
    simp only [hemp, Bool.false_eq_true, ↓reduceIte]
    rw [String.Slice.foldl_toList_eq]
    simp only [Nat.repr, String.toList_ofList, Nat.toDigits]
    have hdig := Nat.toDigitsCore_isDigit (n + 1) n [] (by simp)
    obtain ⟨c, cs, hlist⟩ := List.exists_cons_of_ne_nil (Nat.toDigitsCore_ne_nil n n [])
    rw [hlist]
    have hc : c.isDigit = true := hdig c (hlist ▸ List.Mem.head cs)
    have hnu : ¬(c = '_') := fun h => by subst h; simp [Char.isDigit] at hc
    simp only [List.foldl_cons, hc, decide_eq_false_iff_not.mpr hnu,
               Bool.and_false, Bool.not_false, Bool.and_true, Bool.true_or, Bool.and_true]
    have hcs : ∀ x ∈ cs, x.isDigit = true :=
      fun x hx => hdig x (hlist ▸ List.Mem.tail c hx)
    obtain ⟨hv, hd⟩ := Nat.isNat_foldl_stable cs hcs
    rw [hv, hd]; decide
  simp only [hisNat, ↓reduceIte, Option.some.injEq]
  rw [String.Slice.foldl_toList_eq]
  simp only [Nat.repr, String.toList_ofList, Nat.toDigits]
  exact Nat.toDigitsCore_decode (n + 1) n (by omega)

/-- Nat.repr の各文字は isDigit にゃん -/
theorem Nat.repr_isDigit (n : Nat) : ∀ c ∈ (Nat.repr n).toList, c.isDigit := by
  simp only [Nat.repr, Nat.toDigits, String.toList_ofList]
  exact Nat.toDigitsCore_isDigit (n + 1) n [] (by simp)

/-- Nat.repr の文字はコロン (:) を含まないにゃ（repr_isDigit から導出）-/
theorem Nat.repr_not_colon (n : Nat) : ':' ∉ (Nat.repr n).toList := by
  intro h
  have hd := Nat.repr_isDigit n ':' h
  simp [Char.isDigit] at hd

/-- span Char.isDigit は repr n の文字列とその後のコロン以降を正しく分割するにゃ -/
theorem List.span_isDigit_repr (n : Nat) (rest : List Char) :
    (((Nat.repr n).toList ++ [':'] ++ rest).span Char.isDigit) =
      ((Nat.repr n).toList, [':'] ++ rest) := by
  simp only [List.span]
  rw [List.append_assoc]
  exact List.span_loop_split Char.isDigit (Nat.repr n).toList ':' rest []
    (fun c hc => Nat.repr_isDigit n c hc) (by native_decide)

private theorem String.Slice.front?_eq_copy_head? (s : String.Slice) :
    s.front? = s.copy.toList.head? := by
  simp only [String.Slice.front?, String.Slice.Pos.get?]
  split
  · rename_i h
    have : s.isEmpty := String.Slice.startPos_eq_endPos_iff.mp h
    have : s.copy = "" := String.Slice.copy_eq_empty_iff.mpr this
    simp [this]
  · rename_i h
    have hsp := String.Slice.splits_startPos s
    obtain ⟨t₂', ht₂'⟩ := String.Slice.Pos.Splits.exists_eq_singleton_append h hsp
    rw [ht₂']
    simp [String.toList_append, String.singleton]

private theorem String.front?_toSlice (s : String) :
    s.toSlice.front? = s.toList.head? := by
  rw [String.Slice.front?_eq_copy_head?, String.copy_toSlice]

private theorem Nat.repr_toSlice_front_ne_minus (n : Nat) :
    (Nat.repr n).toSlice.front ≠ '-' := by
  rw [String.Slice.front, String.front?_toSlice]
  have hne := Nat.toDigits_ne_nil n
  simp only [Nat.repr, String.toList_ofList, Nat.toDigits] at hne ⊢
  obtain ⟨c, cs, hlist⟩ := List.exists_cons_of_ne_nil hne
  rw [hlist]; simp only [List.head?, Option.getD_some]
  intro habs; subst habs
  have hd : '-' ∈ Nat.toDigitsCore 10 (n + 1) n [] :=
    hlist ▸ List.Mem.head cs
  have := Nat.toDigitsCore_isDigit (n + 1) n [] (by simp) '-' hd
  simp [Char.isDigit] at this

private theorem String.minus_append_front (s : String) :
    ("-" ++ s).toSlice.front = '-' := by
  rw [String.Slice.front, String.front?_toSlice]
  simp [String.toList_append]

universe u_foldl2 in
private theorem String.Slice.foldl_copy_toList_eq {α : Type u_foldl2} (f : α → Char → α) (init : α)
    (s : String.Slice) : s.foldl f init = s.copy.toList.foldl f init := by
  simp only [String.Slice.foldl]
  rw [← Std.Iter.foldl_toList, String.Slice.toList_chars]

private theorem String.Slice.foldl_eq_copy_toSlice_foldl {α : Type _} (f : α → Char → α) (init : α)
    (s : String.Slice) : s.foldl f init = s.copy.toSlice.foldl f init := by
  rw [String.Slice.foldl_copy_toList_eq, String.Slice.foldl_toList_eq]

private theorem String.Slice.toNat?_eq_copy (s : String.Slice) :
    s.toNat? = s.copy.toNat? := by
  suffices hfoldl : ∀ {α : Type} (f : α → Char → α) (init : α),
      s.foldl f init = s.copy.toSlice.foldl f init from by
    simp only [String.Slice.toNat?, String.toNat?, String.Slice.isNat]
    rw [show s.isEmpty = s.copy.toSlice.isEmpty from by
      rw [String.isEmpty_toSlice, String.Slice.isEmpty_copy]]
    simp only [hfoldl]
  intro α f init
  exact String.Slice.foldl_eq_copy_toSlice_foldl f init s

private theorem String.Slice.copy_sliceFrom_next_singleton (c : Char) (s : String) :
    let sl := (String.singleton c ++ s).toSlice
    have hne : sl.startPos ≠ sl.endPos :=
      String.Slice.startPos_ne_endPos (by
        simp only [sl, String.isEmpty_toSlice]
        rw [Bool.eq_false_iff]
        simp [String.isEmpty_iff, String.singleton])
    (sl.sliceFrom (sl.startPos.next hne)).copy = s := by
  intro sl hne
  have hsp := String.Slice.splits_startPos sl
  have hcopy : sl.copy = String.singleton c ++ s := by simp [sl]
  have hget : sl.startPos.get hne = c := by
    have ht := hsp.exists_eq_singleton_append hne
    obtain ⟨t₂', ht₂'⟩ := ht
    have hspc : sl.copy = String.singleton (sl.startPos.get hne) ++ t₂' := ht₂'
    rw [hcopy] at hspc
    exact (String.singleton_append_inj.mp hspc).1.symm
  have hn := String.Slice.Pos.splits_next sl.startPos hne
  have hsliceTo : (sl.sliceTo sl.startPos).copy = "" := by
    rw [String.Slice.copy_eq_empty_iff]
    exact (String.Slice.isEmpty_sliceTo).mpr rfl
  have hn' : (sl.startPos.next hne).Splits (String.singleton c)
      (sl.sliceFrom (sl.startPos.next hne)).copy := by
    exact hn.of_eq (by rw [hsliceTo, String.empty_append, hget]) rfl
  have heq := hn'.1
  rw [hcopy] at heq
  exact (String.singleton_append_inj.mp heq).2.symm

private theorem String.singleton_append_drop1_copy (c : Char) (s : String) :
    ((String.singleton c ++ s).toSlice.drop 1).copy = s := by
  simp only [String.Slice.drop]
  have hne : (String.singleton c ++ s).toSlice.startPos ≠
             (String.singleton c ++ s).toSlice.endPos :=
    String.Slice.startPos_ne_endPos (by
      rw [String.isEmpty_toSlice, Bool.eq_false_iff]
      simp [String.isEmpty_iff, String.singleton])
  show ((String.singleton c ++ s).toSlice.sliceFrom
    ((String.singleton c ++ s).toSlice.startPos.nextn 1)).copy = s
  unfold String.Slice.Pos.nextn
  simp only [dif_pos hne]
  exact String.Slice.copy_sliceFrom_next_singleton c s

private theorem Int.negOfNat_succ (m : Nat) : Int.negOfNat (m + 1) = Int.negSucc m := rfl

/-- toString は toInt? で往復するにゃ -/
theorem Int.toInt?_toString (n : Int) : (toString n).toInt? = some n := by
  cases n with
  | ofNat m =>
    simp only [ToString.toString]
    simp only [String.toInt?, String.Slice.toInt?]
    have hfne := Nat.repr_toSlice_front_ne_minus m
    simp only [show (Nat.repr m).toSlice.front = '-' ↔ False from ⟨hfne, False.elim⟩,
               ↓reduceIte]
    rw [show (Nat.repr m).toSlice.toNat? = some m from by
      rw [← String.toNat?]; exact Nat.toNat?_repr m]
    simp
  | negSucc m =>
    simp only [ToString.toString]
    rw [String.Internal.append_eq_append]
    simp only [String.toInt?, String.Slice.toInt?]
    have hf := String.minus_append_front (Nat.repr (m + 1))
    simp only [show ("-" ++ Nat.repr (m + 1)).toSlice.front = '-' from hf, ↓reduceIte]
    rw [String.Slice.toNat?_eq_copy]
    rw [show "-" = String.singleton '-' from rfl]
    rw [show Nat.succ m = m + 1 from rfl]
    rw [String.singleton_append_drop1_copy '-' (Nat.repr (m + 1))]
    rw [Nat.toNat?_repr]
    simp [Int.negOfNat_succ]

/-- (a ++ b ++ c).extract a.size (a.size + b.size) = b にゃん -/
theorem byteArray_extract_middle (a b c : ByteArray) :
    (a ++ b ++ c).extract a.size (a.size + b.size) = b := by
  rw [ByteArray.append_assoc]
  apply ByteArray.ext
  simp only [ByteArray.extract, ByteArray.copySlice, ByteArray.data_append,
             show ByteArray.empty.data = #[] from rfl]
  simp only [show ∀ s e, (#[] : Array UInt8).extract s e = #[] from fun _ _ => by simp,
             Array.empty_append, Array.append_empty]
  cases Nat.lt_or_ge 0 b.size with
  | inr h =>
    have : b.size = 0 := Nat.le_zero.mp h
    simp [this, Array.ext_iff, Array.size_extract]
  | inl _ =>
    have ha : a.data.size = a.size := rfl
    have h1 : a.size + (a.size + b.size - a.size) = a.size + b.size := by omega
    rw [h1]
    simp only [Array.ext_iff, Array.size_extract, Array.getElem_extract]
    constructor
    · simp [Array.size_append]
    · intro i hi1 hi2
      simp only [Array.size_append] at hi1
      simp only [Array.getElem_append_right (show a.data.size ≤ a.size + i from by omega),
                 show a.size + i - a.data.size = i from by omega]
      exact Array.getElem_append_left hi2
