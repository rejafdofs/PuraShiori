-- Signaculum.Auxilium.Honorificentia
-- 敬称處理にゃん♪ あやりりす風の敬称檢出・除去を提供するにゃ

set_option autoImplicit false

namespace Signaculum.Auxilium.Honorificentia

-- ═══════════════════════════════════════════════════
--  敬称の種類 (Genera Honorificentiarum)
-- ═══════════════════════════════════════════════════

/-- 敬称の種類にゃん♪ -/
inductive Honorificentia where
  /-- さん -/
  | san
  /-- くん -/
  | kun
  /-- ちゃん -/
  | chan
  /-- 様 -/
  | sama
  /-- 先生 -/
  | sensei
  /-- 殿 -/
  | dono
  /-- 氏 -/
  | shi
  /-- たん -/
  | tan
  /-- にん -/
  | nin
  /-- 敬称なし -/
  | nulla
  deriving Repr, BEq, Inhabited

/-- 敬称の日本語表記にゃん -/
def Honorificentia.adJaponicum : Honorificentia → String
  | .san    => "さん"
  | .kun    => "くん"
  | .chan   => "ちゃん"
  | .sama   => "様"
  | .sensei => "先生"
  | .dono   => "殿"
  | .shi    => "氏"
  | .tan    => "たん"
  | .nin    => "にん"
  | .nulla  => ""

/-- 檢出對象の敬称一覽にゃん（長い順にチェックするにゃ）-/
private def tabulaHonorificentiarum : List (String × Honorificentia) :=
  [ ("先生", .sensei)
  , ("ちゃん", .chan)
  , ("さん", .san)
  , ("くん", .kun)
  , ("たん", .tan)
  , ("にん", .nin)
  , ("様", .sama)
  , ("殿", .dono)
  , ("氏", .shi)
  ]

-- ═══════════════════════════════════════════════════
--  檢出・除去 (Detectio et Ablatio)
-- ═══════════════════════════════════════════════════

/-- 文字列末尾の敬称を檢出するにゃん♪ 見つからなければ `none` にゃ -/
def detege (nomen : String) : Option Honorificentia :=
  tabulaHonorificentiarum.findSome? fun (suffixum, hon) =>
    if nomen.endsWith suffixum then some hon else none

/-- 文字列末尾の敬称を除去するにゃん♪ 敬称が無ければそのまま返すにゃ -/
def aufer (nomen : String) : String :=
  match tabulaHonorificentiarum.find? (fun (suffixum, _) => nomen.endsWith suffixum) with
  | some (suffixum, _) => (nomen.dropEnd suffixum.length).toString
  | none => nomen

/-- 文字列末尾の敬称を檢出して、(名前本體, 敬称) の對を返すにゃん♪ -/
def separa (nomen : String) : String × Honorificentia :=
  match detege nomen with
  | some hon => (aufer nomen, hon)
  | none     => (nomen, .nulla)

/-- 名前に敬称を附けるにゃん♪ -/
def cumHonorificentia (nomen : String) (hon : Honorificentia) : String :=
  nomen ++ hon.adJaponicum

end Signaculum.Auxilium.Honorificentia
