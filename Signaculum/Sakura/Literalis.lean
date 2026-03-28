-- Signaculum.Sakura.Literalis
-- サクラスクリプトリテラルのオーヴァーロード型クラスにゃん♪
-- OfNat と同じ仕組みで、none/default/left 等のキーワードを
-- 期待型に應ぢて自動解決するにゃ

import Signaculum.Sakura.Typi

namespace Signaculum.Sakura

-- ════════════════════════════════════════════════════
--  共通キーワード型クラス (Classis Verborum Communium)
-- ════════════════════════════════════════════════════

/-- "none" キーワードを持つ型にゃん。期待型で自動解決されるにゃ -/
class SakuraNullus (α : Type) where
  nullus : α

/-- "default" キーワードを持つ型にゃん -/
class SakuraPraefinitus (α : Type) where
  praefinitus : α

/-- "disable" キーワードを持つ型にゃん -/
class SakuraInhabilis (α : Type) where
  inhabilis : α

-- ════════════════════════════════════════════════════
--  方向キーワード型クラス (Classis Directionum)
-- ════════════════════════════════════════════════════

/-- "left" キーワードを持つ型にゃん -/
class SakuraSinistrum (α : Type) where
  sinistrum : α

/-- "right" キーワードを持つ型にゃん -/
class SakuraDextrum (α : Type) where
  dextrum : α

/-- "center" キーワードを持つ型にゃん -/
class SakuraCentrum (α : Type) where
  centrum : α

/-- "top" キーワードを持つ型にゃん -/
class SakuraSummum (α : Type) where
  summum : α

/-- "bottom" キーワードを持つ型にゃん -/
class SakuraImum (α : Type) where
  imum : α

/-- "middle" キーワードを持つ型にゃん -/
class SakuraMedium (α : Type) where
  medium : α

/-- "justify" キーワードを持つ型にゃん -/
class SakuraContentum (α : Type) where
  contentum : α

-- ════════════════════════════════════════════════════
--  書體スタイルキーワード型クラス
-- ════════════════════════════════════════════════════

/-- "offset" キーワードを持つ型にゃん -/
class SakuraOffset (α : Type) where
  offset : α

/-- "outline" キーワードを持つ型にゃん -/
class SakuraContornus (α : Type) where
  contornus : α

/-- "square" キーワードを持つ型にゃん -/
class SakuraQuadratum (α : Type) where
  quadratum : α

/-- "underline" キーワードを持つ型にゃん -/
class SakuraSublinea (α : Type) where
  sublinea : α

-- ════════════════════════════════════════════════════
--  壁紙モードキーワード型クラス
-- ════════════════════════════════════════════════════

/-- "tile" キーワードを持つ型にゃん -/
class SakuraTessella (α : Type) where
  tessella : α

/-- "stretch" キーワードを持つ型にゃん -/
class SakuraExtende (α : Type) where
  extende : α

/-- "span" キーワードを持つ型にゃん -/
class SakuraSpatium (α : Type) where
  spatium : α

-- ════════════════════════════════════════════════════
--  Bool 系キーワード型クラス
-- ════════════════════════════════════════════════════

/-- "true" キーワードを持つ型にゃん -/
class SakuraActivus (α : Type) where
  activus : α

/-- "false" キーワードを持つ型にゃん -/
class SakuraInactivus (α : Type) where
  inactivus : α

-- ════════════════════════════════════════════════════
--  Coloris インスタンス群
-- ════════════════════════════════════════════════════

instance {α : Type} : SakuraNullus (Option α) where nullus := .none

instance : SakuraNullus Coloris where nullus := .nullus
instance : SakuraPraefinitus Coloris where praefinitus := .praefinitus
instance : SakuraInhabilis Coloris where inhabilis := .inhabilis

-- ════════════════════════════════════════════════════
--  DirectioAllineatio インスタンス群
-- ════════════════════════════════════════════════════

instance : SakuraSinistrum DirectioAllineatio where sinistrum := .sinistrum
instance : SakuraDextrum DirectioAllineatio where dextrum := .dextrum
instance : SakuraCentrum DirectioAllineatio where centrum := .centrum
instance : SakuraContentum DirectioAllineatio where contentum := .contentum

-- ════════════════════════════════════════════════════
--  DirectioVerticalis インスタンス群
-- ════════════════════════════════════════════════════

instance : SakuraSummum DirectioVerticalis where summum := .summum
instance : SakuraMedium DirectioVerticalis where medium := .medium
instance : SakuraImum DirectioVerticalis where imum := .imum

-- ════════════════════════════════════════════════════
--  DirectioAllineatioBullae インスタンス群
-- ════════════════════════════════════════════════════

instance : SakuraSinistrum DirectioAllineatioBullae where sinistrum := .sinistrum
instance : SakuraDextrum DirectioAllineatioBullae where dextrum := .dextrum
instance : SakuraCentrum DirectioAllineatioBullae where centrum := .centrum
instance : SakuraSummum DirectioAllineatioBullae where summum := .summum
instance : SakuraImum DirectioAllineatioBullae where imum := .imum
instance : SakuraNullus DirectioAllineatioBullae where nullus := .nullus

-- ════════════════════════════════════════════════════
--  StylusUmbrae インスタンス群
-- ════════════════════════════════════════════════════

instance : SakuraOffset StylusUmbrae where offset := .offset
instance : SakuraContornus StylusUmbrae where contornus := .contornus
instance : SakuraPraefinitus StylusUmbrae where praefinitus := .praefinitus

-- ════════════════════════════════════════════════════
--  StatusContorni インスタンス群
-- ════════════════════════════════════════════════════

instance : SakuraActivus StatusContorni where activus := .activus
instance : SakuraInactivus StatusContorni where inactivus := .inactivus
instance : SakuraPraefinitus StatusContorni where praefinitus := .praefinitus
instance : SakuraInhabilis StatusContorni where inhabilis := .inhabilis

-- ════════════════════════════════════════════════════
--  FormaMarci インスタンス群
-- ════════════════════════════════════════════════════

instance : SakuraQuadratum FormaMarci where quadratum := .quadratum
instance : SakuraSublinea FormaMarci where sublinea := .sublineaForma
instance : SakuraNullus FormaMarci where nullus := .nullus
instance : SakuraPraefinitus FormaMarci where praefinitus := .praefinitus

-- ════════════════════════════════════════════════════
--  MethodusMarci インスタンス群
-- ════════════════════════════════════════════════════

instance : SakuraPraefinitus MethodusMarci where praefinitus := .praefinitus

-- ════════════════════════════════════════════════════
--  ModusTapetis インスタンス群
-- ════════════════════════════════════════════════════

instance : SakuraCentrum ModusTapetis where centrum := .centrum
instance : SakuraTessella ModusTapetis where tessella := .tessella
instance : SakuraExtende ModusTapetis where extende := .extende
instance : SakuraSpatium ModusTapetis where spatium := .spatium

-- ════════════════════════════════════════════════════
--  MagnitudoLitterarum インスタンス群
-- ════════════════════════════════════════════════════

instance : SakuraPraefinitus MagnitudoLitterarum where praefinitus := .praefinita

-- ════════════════════════════════════════════════════
--  MethodusMarci 文字列解決 (toString → コンストラクタ)
--  型クラスでは表現しにくい多數のキーワードは
--  専用の解決關數で處理するにゃ
-- ════════════════════════════════════════════════════

/-- 文字列から MethodusMarci を解決するにゃん♪
    型クラスでは數が多すぎるからテーブルルックアップにゃ -/
def MethodusMarci.eNomen? : String → Option MethodusMarci
  | "black"       => some .black
  | "notmergepen" => some .notmergepen
  | "masknotpen"  => some .masknotpen
  | "notcopypen"  => some .notcopypen
  | "maskpennot"  => some .maskpennot
  | "not"         => some .not
  | "xorpen"      => some .xorpen
  | "notmaskpen"  => some .notmaskpen
  | "maskpen"     => some .maskpen
  | "notxorpen"   => some .notxorpen
  | "nop"         => some .nop
  | "mergenotpen" => some .mergenotpen
  | "copypen"     => some .copypen
  | "mergepennot" => some .mergepennot
  | "mergepen"    => some .mergepen
  | "white"       => some .white
  | "xor"         => some .xor
  | "alpha"       => some .alpha
  | "normal"      => some .normal
  | "default"     => some .praefinitus
  | _             => none

-- ════════════════════════════════════════════════════
--  汎用キーワード解決關數
--  エラボレーターが ident 文字列からキーワード型クラスの
--  term を生成するにゃ
-- ════════════════════════════════════════════════════

/-- ident 文字列から型クラスベースのキーワード term を生成するにゃん♪
    一致するキーワードがなければ none を返すにゃ
    エラボレーターで期待型を show で注釋すれば型推論が解決するにゃ -/
def sakuraKeywordTerms : String → List String
  | "none"      => ["SakuraNullus.nullus"]
  | "default"   => ["SakuraPraefinitus.praefinitus"]
  | "disable"   => ["SakuraInhabilis.inhabilis"]
  | "left"      => ["SakuraSinistrum.sinistrum"]
  | "right"     => ["SakuraDextrum.dextrum"]
  | "center"    => ["SakuraCentrum.centrum"]
  | "top"       => ["SakuraSummum.summum"]
  | "bottom"    => ["SakuraImum.imum"]
  | "middle"    => ["SakuraMedium.medium"]
  | "justify"   => ["SakuraContentum.contentum"]
  | "offset"    => ["SakuraOffset.offset"]
  | "outline"   => ["SakuraContornus.contornus"]
  | "square"    => ["SakuraQuadratum.quadratum"]
  | "underline" => ["SakuraSublinea.sublinea"]
  | "tile"      => ["SakuraTessella.tessella"]
  | "stretch"   => ["SakuraExtende.extende"]
  | "span"      => ["SakuraSpatium.spatium"]
  | "true"      => ["SakuraActivus.activus"]
  | "false"     => ["SakuraInactivus.inactivus"]
  | _           => []

end Signaculum.Sakura
