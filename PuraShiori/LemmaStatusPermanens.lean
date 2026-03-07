-- PuraShiori.LemmaStatusPermanens
-- StatusPermanens 関連の sorry 補題にゃん
-- Lemma.lean と同じ位置づけだが、StatusPermanens の内部定義を参照するため
-- import 順の都合でここに分離してゐるにゃ

import PuraShiori.StatusPermanens

namespace PuraShiori

-- ═══════════════════════════════════════════════════
-- sorry 領域（理論上証明可能だが後回し）にゃん
-- ═══════════════════════════════════════════════════

/-- prefix を前置しても readU64LE の結果は位置だけずれるにゃん -/
theorem readU64LE_at_prefix (pre : ByteArray) (n : UInt64) (rest : ByteArray) :
    readU64LE (pre ++ u64LE n ++ rest) pre.size = some (n, pre.size + 8) := by sorry

/-- prefix を前置しても legereParia の結果は位置だけずれるにゃん -/
theorem legereParia_at_prefix (cnt pos : Nat) (pre dat : ByteArray) :
    legereParia (pre ++ dat) cnt (pre.size + pos) =
      (legereParia dat cnt pos).map (fun (ps, q) => (ps, pre.size + q)) := by sorry

/-- legereParia が serializeParia を正しく復元するにゃん -/
theorem legereParia_serializeParia
    (paria : List (String × String × ByteArray)) (rest : ByteArray) :
    legereParia (serializeParia paria ++ rest) paria.length 0 =
      some (paria, (serializeParia paria).size) := by sorry

-- ═══════════════════════════════════════════════════
-- 証明領域にゃん
-- ═══════════════════════════════════════════════════

/-- シリアライズしてデシリアライズすると元のデータに戻るにゃん♪
    sorry 補題（readU64LE_at_prefix, legereParia_at_prefix, legereParia_serializeParia）を使ふにゃ -/
theorem serializeMappam_roundtrip (paria : List (String × String × ByteArray)) :
    deserializeMappam (serializeMappam paria) = some paria := by
  -- Step 1: 補助事実にゃ
  have hsize : ¬ ((magicBytes ++ u64LE paria.length.toUInt64 ++ serializeParia paria).size < 12) := by
    simp only [ByteArray.size_append]
    have h1 : magicBytes.size = 4 := rfl
    have h2 : (u64LE paria.length.toUInt64).size = 8 := rfl
    omega
  have hmagic : (magicBytes ++ u64LE paria.length.toUInt64 ++ serializeParia paria).extract 0 4 =
      magicBytes := by
    rw [ByteArray.append_assoc]; exact ByteArray.extract_append_eq_left rfl
  have hbne : ((magicBytes ++ u64LE paria.length.toUInt64 ++ serializeParia paria).extract 0 4
      != magicBytes) = false := by rw [hmagic]; native_decide
  have h_read := readU64LE_at_prefix magicBytes paria.length.toUInt64 (serializeParia paria)
  simp only [show magicBytes.size = 4 from rfl] at h_read
  have hlen : paria.length.toUInt64.toNat = paria.length :=
    Nat.toUInt64_toNat_of_lt (List.length_lt_UInt64Size paria)
  have h_pre_sz : (magicBytes ++ u64LE paria.length.toUInt64).size = 12 := by
    simp only [ByteArray.size_append]
    have h1 : magicBytes.size = 4 := rfl
    have h2 : (u64LE paria.length.toUInt64).size = 8 := rfl
    omega
  have h_legere := legereParia_at_prefix paria.length 0
    (magicBytes ++ u64LE paria.length.toUInt64) (serializeParia paria)
  simp only [h_pre_sz, Nat.add_zero] at h_legere
  have h_sp := legereParia_serializeParia paria .empty
  simp only [ByteArray.append_empty] at h_sp
  -- Step 2: 展開 + if ガード除去にゃ
  simp only [deserializeMappam, serializeMappam]
  rw [if_neg hsize, hbne, if_neg (by decide)]
  -- Step 3: bind チェーンを simp で整理にゃ
  simp [h_read, hlen, h_legere, h_sp, Option.map_some]

end PuraShiori
