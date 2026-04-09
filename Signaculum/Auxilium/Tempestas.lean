-- Signaculum.Auxilium.Tempestas
-- 季節・時間帯ヘルパーにゃん♪ あやりりす風の時間帶判定を提供するにゃ

set_option autoImplicit false

namespace Signaculum.Auxilium.Tempestas

-- ═══════════════════════════════════════════════════
--  季節 (Tempestas)
-- ═══════════════════════════════════════════════════

/-- 四季にゃん♪ -/
inductive Tempestas where
  /-- 春（3〜5月）にゃ -/
  | ver
  /-- 夏（6〜8月）にゃ -/
  | aestas
  /-- 秋（9〜11月）にゃ -/
  | autumnus
  /-- 冬（12〜2月）にゃ -/
  | hiems
  deriving Repr, BEq, Inhabited

/-- 季節の日本語表記にゃん -/
def Tempestas.adJaponicum : Tempestas → String
  | .ver      => "春"
  | .aestas   => "夏"
  | .autumnus => "秋"
  | .hiems    => "冬"

/-- 月から季節を判定するにゃん（1〜12）-/
def Tempestas.exMense (mensis : Nat) : Tempestas :=
  if mensis ≥ 3 && mensis ≤ 5 then .ver
  else if mensis ≥ 6 && mensis ≤ 8 then .aestas
  else if mensis ≥ 9 && mensis ≤ 11 then .autumnus
  else .hiems

-- ═══════════════════════════════════════════════════
--  時間帯 (Horae)
-- ═══════════════════════════════════════════════════

/-- 時間帯にゃん♪ -/
inductive Horae where
  /-- 深夜（0〜4時）にゃ -/
  | noctuProfunda
  /-- 朝（5〜9時）にゃ -/
  | mane
  /-- 昼（10〜15時）にゃ -/
  | meridies
  /-- 夕方（16〜18時）にゃ -/
  | vespera
  /-- 夜（19〜23時）にゃ -/
  | nox
  deriving Repr, BEq, Inhabited

/-- 時間帯の日本語表記にゃん -/
def Horae.adJaponicum : Horae → String
  | .noctuProfunda => "深夜"
  | .mane          => "朝"
  | .meridies      => "昼"
  | .vespera       => "夕方"
  | .nox           => "夜"

/-- 時（0〜23）から時間帯を判定するにゃん -/
def Horae.exHora (hora : Nat) : Horae :=
  if hora ≤ 4 then .noctuProfunda
  else if hora ≤ 9 then .mane
  else if hora ≤ 15 then .meridies
  else if hora ≤ 18 then .vespera
  else .nox

-- ═══════════════════════════════════════════════════
--  食事時 (Tempus Cibi)
-- ═══════════════════════════════════════════════════

/-- 食事の種類にゃん -/
inductive Cibus where
  /-- 朝食（6〜8時）にゃ -/
  | ientaculum
  /-- 昼食（11〜13時）にゃ -/
  | prandium
  /-- 夕食（18〜20時）にゃ -/
  | cena
  /-- 食事時ではにゃい -/
  | nullus
  deriving Repr, BEq, Inhabited

/-- 食事種類の日本語表記にゃん -/
def Cibus.adJaponicum : Cibus → String
  | .ientaculum => "朝食"
  | .prandium   => "昼食"
  | .cena       => "夕食"
  | .nullus     => ""

/-- 時から食事時を判定するにゃん -/
def Cibus.exHora (hora : Nat) : Cibus :=
  if hora ≥ 6 && hora ≤ 8 then .ientaculum
  else if hora ≥ 11 && hora ≤ 13 then .prandium
  else if hora ≥ 18 && hora ≤ 20 then .cena
  else .nullus

-- ═══════════════════════════════════════════════════
--  IO ヘルパー（現在時刻から判定）
-- ═══════════════════════════════════════════════════

/-- Reference 頭部から年月日時を取得するヘルパーにゃん。
    OnSecondChange / OnMinuteChange の Reference から時刻情報を取得するにゃ。
    各引數は文字列で渡されるので、パース失敗時は 0 を返すにゃん -/
def exReferentia (anno mense die hora : String) : Nat × Nat × Nat × Nat :=
  (anno.toNat?.getD 0, mense.toNat?.getD 0, die.toNat?.getD 0, hora.toNat?.getD 0)

/-- 年と月から季節を取得するにゃん -/
def tempestasExMense (mensis : Nat) : Tempestas := Tempestas.exMense mensis

/-- 時から時間帯を取得するにゃん -/
def horaeExHora (hora : Nat) : Horae := Horae.exHora hora

/-- 時から食事時を判定するにゃん -/
def cibusExHora (hora : Nat) : Cibus := Cibus.exHora hora

/-- 食事時かどうかを判定するにゃん -/
def estTempusCibi (hora : Nat) : Bool := Cibus.exHora hora != .nullus

end Signaculum.Auxilium.Tempestas
