-- Signaculum.Sakura.Textus.Formae
-- 書體・カーソルスタイル・錨スタイル關數にゃん♪

import Signaculum.Sakura.Fundamentum

namespace Signaculum.Sakura.Textus

-- ════════════════════════════════════════════════════
--  書體 (Forma Litterarum)
-- ════════════════════════════════════════════════════

/-- 太字の切替（\\f[bold,b]）にゃん -/
def audax {m : Type → Type} [Monad m] (b : Bool := true) : SakuraM m Unit :=
  emitte (.formae (.audax b))

/-- 斜體の切替（\\f[italic,b]）にゃん -/
def obliquus {m : Type → Type} [Monad m] (b : Bool := true) : SakuraM m Unit :=
  emitte (.formae (.obliquus b))

/-- 下線の切替（\\f[underline,b]）にゃん -/
def sublinea {m : Type → Type} [Monad m] (b : Bool := true) : SakuraM m Unit :=
  emitte (.formae (.sublinea b))

/-- 取消線の切替（\\f[strike,b]）にゃん -/
def deletura {m : Type → Type} [Monad m] (b : Bool := true) : SakuraM m Unit :=
  emitte (.formae (.deletura b))

/-- 文字色の設定（\\f[color,色]）にゃん。
    `Coloris.rgb 255 0 0`、`Coloris.hex "#FF0000"`、`Coloris.nomen "red"` 全部使へるにゃ -/
def color {m : Type → Type} [Monad m] (c : Coloris) : SakuraM m Unit :=
  emitte (.formae (.color c))

/-- 文字の大きさ（\\f[height,...]）にゃん。
    絕對ピクセル、相對（+/−）、百分率、default が指定できるにゃ -/
def altitudoLitterarum {m : Type → Type} [Monad m] (mag : MagnitudoLitterarum) : SakuraM m Unit :=
  emitte (.formae (.altitudoLitterarum mag))

/-- 書體名の設定（\\f[name,font]）にゃん -/
def nomenFontis {m : Type → Type} [Monad m] (nomen : String) : SakuraM m Unit :=
  emitte (.formae (.nomenFontis nomen))

/-- 文字揃へ（\\f[align,方向]）にゃん -/
def allineatio {m : Type → Type} [Monad m] (directio : DirectioAllineatio) : SakuraM m Unit :=
  emitte (.formae (.allineatio directio))

/-- 縦方向文字揃へ（\\f[valign,方向]）にゃん -/
def allineatioVerticalis {m : Type → Type} [Monad m] (directio : DirectioVerticalis) : SakuraM m Unit :=
  emitte (.formae (.allineatioVerticalis directio))

/-- 文字影の色を設定するにゃん（\\f[shadowcolor,色]）。
    "none" で影を無效にするにゃ -/
def colorUmbrae {m : Type → Type} [Monad m] (coloris : Coloris) : SakuraM m Unit :=
  emitte (.formae (.colorUmbrae coloris))

/-- 文字影のスタイルを設定するにゃん（\\f[shadowstyle,スタイル]）。
    `offset`=右下ずらし、`contornus`=輪郭風、`praefinitus`=既定にゃ -/
def stylumUmbrae {m : Type → Type} [Monad m] (stylus : StylusUmbrae) : SakuraM m Unit :=
  emitte (.formae (.stylumUmbrae stylus))

/-- 文字の輪郭を設定するにゃん（\\f[outline,パラメータ]）。
    `activus`=有效、`inactivus`=無效、`praefinitus`=既定、`inhabilis`=無效化にゃ -/
def contornus {m : Type → Type} [Monad m] (parametrum : StatusContorni) : SakuraM m Unit :=
  emitte (.formae (.contornus parametrum))

/-- 下付き文字の切替にゃん（\\f[sub,true/false]）-/
def subscriptus {m : Type → Type} [Monad m] (b : Bool := true) : SakuraM m Unit :=
  emitte (.formae (.subscriptus b))

/-- 上付き文字の切替にゃん（\\f[sup,true/false]）-/
def superscriptus {m : Type → Type} [Monad m] (b : Bool := true) : SakuraM m Unit :=
  emitte (.formae (.superscriptus b))

/-- テキスト表示を無效にするにゃん（\\f[disable]）-/
def formaInhabilis {m : Type → Type} [Monad m] : SakuraM m Unit :=
  emitte (.formae .formaInhabilis)

/-- 書式を既定に戾す（\\f[default]）にゃん -/
def formaPraefinita {m : Type → Type} [Monad m] : SakuraM m Unit :=
  emitte (.formae .formaPraefinita)

-- ════════════════════════════════════════════════════
--  カーソル（選擇中）スタイル
-- ════════════════════════════════════════════════════

/-- 選擇中カーソルの形状にゃん（\\f[cursorstyle,形状]）-/
def stylumCursorisElecti {m : Type → Type} [Monad m] (forma : FormaMarci) : SakuraM m Unit :=
  emitte (.formae (.stylumCursorisElecti forma))

/-- 選擇中カーソルの色にゃん（\\f[cursorcolor,色]）-/
def colorCursorisElecti {m : Type → Type} [Monad m] (coloris : Coloris) : SakuraM m Unit :=
  emitte (.formae (.colorCursorisElecti coloris))

/-- 選擇中カーソルの塗り色にゃん（\\f[cursorbrushcolor,色]）-/
def colorPenicilliCursorisElecti {m : Type → Type} [Monad m] (coloris : Coloris) : SakuraM m Unit :=
  emitte (.formae (.colorPenicilliCursorisElecti coloris))

/-- 選擇中カーソルの縁色にゃん（\\f[cursorpencolor,色]）-/
def colorCalamCursorisElecti {m : Type → Type} [Monad m] (coloris : Coloris) : SakuraM m Unit :=
  emitte (.formae (.colorCalamCursorisElecti coloris))

/-- 選擇中カーソルの文字色にゃん（\\f[cursorfontcolor,色]）-/
def colorFontisCursorisElecti {m : Type → Type} [Monad m] (coloris : Coloris) : SakuraM m Unit :=
  emitte (.formae (.colorFontisCursorisElecti coloris))

/-- 選擇中カーソルの描畫方法にゃん（\\f[cursormethod,方法]）-/
def methodusCursorisElecti {m : Type → Type} [Monad m] (methodus : MethodusMarci) : SakuraM m Unit :=
  emitte (.formae (.methodusCursorisElecti methodus))

-- ════════════════════════════════════════════════════
--  カーソル（未選擇）スタイル
-- ════════════════════════════════════════════════════

/-- 未選擇カーソルの形状にゃん（\\f[cursornotselectstyle,形状]）-/
def stylumCursorisNonElecti {m : Type → Type} [Monad m] (forma : FormaMarci) : SakuraM m Unit :=
  emitte (.formae (.stylumCursorisNonElecti forma))

/-- 未選擇カーソルの色にゃん（\\f[cursornotselectcolor,色]）-/
def colorCursorisNonElecti {m : Type → Type} [Monad m] (coloris : Coloris) : SakuraM m Unit :=
  emitte (.formae (.colorCursorisNonElecti coloris))

/-- 未選擇カーソルの塗り色にゃん（\\f[cursornotselectbrushcolor,色]）-/
def colorPenicilliCursorisNonElecti {m : Type → Type} [Monad m] (coloris : Coloris) : SakuraM m Unit :=
  emitte (.formae (.colorPenicilliCursorisNonElecti coloris))

/-- 未選擇カーソルの縁色にゃん（\\f[cursornotselectpencolor,色]）-/
def colorCalamCursorisNonElecti {m : Type → Type} [Monad m] (coloris : Coloris) : SakuraM m Unit :=
  emitte (.formae (.colorCalamCursorisNonElecti coloris))

/-- 未選擇カーソルの文字色にゃん（\\f[cursornotselectfontcolor,色]）-/
def colorFontisCursorisNonElecti {m : Type → Type} [Monad m] (coloris : Coloris) : SakuraM m Unit :=
  emitte (.formae (.colorFontisCursorisNonElecti coloris))

/-- 未選擇カーソルの描畫方法にゃん（\\f[cursornotselectmethod,方法]）-/
def methodusCursorisNonElecti {m : Type → Type} [Monad m] (methodus : MethodusMarci) : SakuraM m Unit :=
  emitte (.formae (.methodusCursorisNonElecti methodus))

-- ════════════════════════════════════════════════════
--  錨（選擇中）スタイル
-- ════════════════════════════════════════════════════

/-- 錨テクストゥス全體色（\\f[anchor.font.color,色]）にゃん -/
def colorFontisAncorae {m : Type → Type} [Monad m] (coloris : Coloris) : SakuraM m Unit :=
  emitte (.formae (.colorFontisAncorae coloris))

/-- 選擇中の錨形状にゃん（\\f[anchorstyle,形状]）-/
def stylumAncorae {m : Type → Type} [Monad m] (forma : FormaMarci) : SakuraM m Unit :=
  emitte (.formae (.stylumAncorae forma))

/-- 選擇中の錨色にゃん（\\f[anchorcolor,色]）-/
def colorAncorae {m : Type → Type} [Monad m] (coloris : Coloris) : SakuraM m Unit :=
  emitte (.formae (.colorAncorae coloris))

/-- 選擇中の錨塗り色にゃん（\\f[anchorbrushcolor,色]）-/
def colorPenicilliAncorae {m : Type → Type} [Monad m] (coloris : Coloris) : SakuraM m Unit :=
  emitte (.formae (.colorPenicilliAncorae coloris))

/-- 選擇中の錨縁色にゃん（\\f[anchorpencolor,色]）-/
def colorCalamAncorae {m : Type → Type} [Monad m] (coloris : Coloris) : SakuraM m Unit :=
  emitte (.formae (.colorCalamAncorae coloris))

/-- 選擇中の錨文字色にゃん（\\f[anchorfontcolor,色]）-/
def colorFontisAncoraeTotae {m : Type → Type} [Monad m] (coloris : Coloris) : SakuraM m Unit :=
  emitte (.formae (.colorFontisAncoraeTotae coloris))

/-- 選擇中の錨描畫方法にゃん（\\f[anchormethod,方法]）-/
def methodusAncorae {m : Type → Type} [Monad m] (methodus : MethodusMarci) : SakuraM m Unit :=
  emitte (.formae (.methodusAncorae methodus))

-- ════════════════════════════════════════════════════
--  錨（未選擇）スタイル
-- ════════════════════════════════════════════════════

/-- 未選擇の錨形状にゃん（\\f[anchornotselectstyle,形状]）-/
def stylumAncoraeNonElectae {m : Type → Type} [Monad m] (forma : FormaMarci) : SakuraM m Unit :=
  emitte (.formae (.stylumAncoraeNonElectae forma))

/-- 未選擇の錨色にゃん（\\f[anchornotselectcolor,色]）-/
def colorAncoraeNonElectae {m : Type → Type} [Monad m] (coloris : Coloris) : SakuraM m Unit :=
  emitte (.formae (.colorAncoraeNonElectae coloris))

/-- 未選擇の錨塗り色にゃん（\\f[anchornotselectbrushcolor,色]）-/
def colorPenicilliAncoraeNonElectae {m : Type → Type} [Monad m] (coloris : Coloris) : SakuraM m Unit :=
  emitte (.formae (.colorPenicilliAncoraeNonElectae coloris))

/-- 未選擇の錨縁色にゃん（\\f[anchornotselectpencolor,色]）-/
def colorCalamAncoraeNonElectae {m : Type → Type} [Monad m] (coloris : Coloris) : SakuraM m Unit :=
  emitte (.formae (.colorCalamAncoraeNonElectae coloris))

/-- 未選擇の錨文字色にゃん（\\f[anchornotselectfontcolor,色]）-/
def colorFontisAncoraeNonElectae {m : Type → Type} [Monad m] (coloris : Coloris) : SakuraM m Unit :=
  emitte (.formae (.colorFontisAncoraeNonElectae coloris))

/-- 未選擇の錨描畫方法にゃん（\\f[anchornotselectmethod,方法]）-/
def methodusAncoraeNonElectae {m : Type → Type} [Monad m] (methodus : MethodusMarci) : SakuraM m Unit :=
  emitte (.formae (.methodusAncoraeNonElectae methodus))

-- ════════════════════════════════════════════════════
--  錨（訪問済み）スタイル
-- ════════════════════════════════════════════════════

/-- 訪問済み錨形状にゃん（\\f[anchorvisitedstyle,形状]）-/
def stylumAncoraeVisae {m : Type → Type} [Monad m] (forma : FormaMarci) : SakuraM m Unit :=
  emitte (.formae (.stylumAncoraeVisae forma))

/-- 訪問済み錨色にゃん（\\f[anchorvisitedcolor,色]）-/
def colorAncoraeVisae {m : Type → Type} [Monad m] (coloris : Coloris) : SakuraM m Unit :=
  emitte (.formae (.colorAncoraeVisae coloris))

/-- 訪問済み錨塗り色にゃん（\\f[anchorvisitedbrushcolor,色]）-/
def colorPenicilliAncoraeVisae {m : Type → Type} [Monad m] (coloris : Coloris) : SakuraM m Unit :=
  emitte (.formae (.colorPenicilliAncoraeVisae coloris))

/-- 訪問済み錨縁色にゃん（\\f[anchorvisitedpencolor,色]）-/
def colorCalamAncoraeVisae {m : Type → Type} [Monad m] (coloris : Coloris) : SakuraM m Unit :=
  emitte (.formae (.colorCalamAncoraeVisae coloris))

/-- 訪問済み錨文字色にゃん（\\f[anchorvisitedfontcolor,色]）-/
def colorFontisAncoraeVisae {m : Type → Type} [Monad m] (coloris : Coloris) : SakuraM m Unit :=
  emitte (.formae (.colorFontisAncoraeVisae coloris))

/-- 訪問済み錨描畫方法にゃん（\\f[anchorvisitedmethod,方法]）-/
def methodusAncoraeVisae {m : Type → Type} [Monad m] (methodus : MethodusMarci) : SakuraM m Unit :=
  emitte (.formae (.methodusAncoraeVisae methodus))

end Signaculum.Sakura.Textus
