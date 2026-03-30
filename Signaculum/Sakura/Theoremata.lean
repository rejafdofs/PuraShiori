-- Signaculum.Sakura.Theoremata
-- 全稱證明にゃん♪ adCatenam 函數の正しさを∀量化で證明するにゃ

import Signaculum.Sakura.Signum

namespace Signaculum.Sakura

open Signaculum.Sakura.Signum

-- ═══════════════════════════════════════════════════════════
-- § 1. Bool パラメートゥルムの全稱證明にゃん♪
-- ═══════════════════════════════════════════════════════════

-- フォルマエ: audax (太字にゃ)
theorem theoremaFormaeAudaxAdCatenam : ∀ (b : Bool),
  SignumFormae.adCatenam (.audax b) = s!"\\f[bold,{if b then "true" else "false"}]" := by
  intro b; cases b <;> rfl

-- フォルマエ: obliquus (斜體にゃ)
theorem theoremaFormaeObliquusAdCatenam : ∀ (b : Bool),
  SignumFormae.adCatenam (.obliquus b) = s!"\\f[italic,{if b then "true" else "false"}]" := by
  intro b; cases b <;> rfl

-- フォルマエ: sublinea (下線にゃ)
theorem theoremaFormaeSublineaAdCatenam : ∀ (b : Bool),
  SignumFormae.adCatenam (.sublinea b) = s!"\\f[underline,{if b then "true" else "false"}]" := by
  intro b; cases b <;> rfl

-- フォルマエ: deletura (取消線にゃ)
theorem theoremaFormaeDeleturaAdCatenam : ∀ (b : Bool),
  SignumFormae.adCatenam (.deletura b) = s!"\\f[strike,{if b then "true" else "false"}]" := by
  intro b; cases b <;> rfl

-- フォルマエ: subscriptus (下付きにゃ)
theorem theoremaFormaeSubscriptusAdCatenam : ∀ (b : Bool),
  SignumFormae.adCatenam (.subscriptus b) = s!"\\f[sub,{if b then "true" else "false"}]" := by
  intro b; cases b <;> rfl

-- フォルマエ: superscriptus (上付きにゃ)
theorem theoremaFormaeSuperscriptusAdCatenam : ∀ (b : Bool),
  SignumFormae.adCatenam (.superscriptus b) = s!"\\f[sup,{if b then "true" else "false"}]" := by
  intro b; cases b <;> rfl

-- インペリウム: sectionCeler (クイックセクティオにゃ)
theorem theoremaImperiiSectionCelerAdCatenam : ∀ (b : Bool),
  SignumImperii.adCatenam (.sectionCeler b) = s!"\\![quicksection,{if b then "true" else "false"}]" := by
  intro b; cases b <;> rfl

-- ═══════════════════════════════════════════════════════════
-- § 2. 定數コンストゥルクトルの證明 (rfl) にゃん♪
-- ═══════════════════════════════════════════════════════════

-- スコピ (範圍制御にゃ)
theorem theoremaScopiSakuraAdCatenam : SignumScopi.adCatenam .sakura = "\\h" := by rfl
theorem theoremaScopiKeroAdCatenam : SignumScopi.adCatenam .kero = "\\u" := by rfl

-- インペリウム (制御シグヌムにゃ) 14個
theorem theoremaImperiiFinis : SignumImperii.adCatenam .finis = "\\e" := by rfl
theorem theoremaImperiiCeler : SignumImperii.adCatenam .celer = "\\_q" := by rfl
theorem theoremaImperiiExitus : SignumImperii.adCatenam .exitus = "\\-" := by rfl
theorem theoremaImperiiSynchrona : SignumImperii.adCatenam .synchrona = "\\_s" := by rfl
theorem theoremaImperiiMutaGhost : SignumImperii.adCatenam .mutaGhost = "\\+" := by rfl
theorem theoremaImperiiMutaGhostSequens : SignumImperii.adCatenam .mutaGhostSequens = "\\_+" := by rfl
theorem theoremaImperiiProhibeTempus : SignumImperii.adCatenam .prohibeTempus = "\\*" := by rfl
theorem theoremaImperiiTempusCriticum : SignumImperii.adCatenam .tempusCriticum = "\\t" := by rfl
theorem theoremaImperiiAccede : SignumImperii.adCatenam .accede = "\\5" := by rfl
theorem theoremaImperiiRecede : SignumImperii.adCatenam .recede = "\\4" := by rfl
theorem theoremaImperiiSyncTempus : SignumImperii.adCatenam .syncTempus = "\\6" := by rfl
theorem theoremaImperiiEventumTempus : SignumImperii.adCatenam .eventumTempus = "\\7" := by rfl
theorem theoremaImperiiTogglaSupra : SignumImperii.adCatenam .togglaSupra = "\\v" := by rfl
theorem theoremaImperiiInhibeTagas : SignumImperii.adCatenam .inhibeTagas = "\\_?" := by rfl

-- モーラエ (待機シグヌムにゃ)
theorem theoremaMoraeExpecta : SignumMorae.adCatenam .expecta = "\\x" := by rfl
theorem theoremaMoraeExpectaSine : SignumMorae.adCatenam .expectaSine = "\\x[noclear]" := by rfl
theorem theoremaMoraeReseraTimerSynchrinae : SignumMorae.adCatenam .reseraTimerSynchrinae = "\\__w[clear]" := by rfl

-- エクシビティオニス (表示シグヌムにゃ)
theorem theoremaExhibitionisLinea : SignumExhibitionis.adCatenam .linea = "\\n" := by rfl
theorem theoremaExhibitionisDimidiaLinea : SignumExhibitionis.adCatenam .dimidiaLinea = "\\n[half]" := by rfl
theorem theoremaExhibitionisPurga : SignumExhibitionis.adCatenam .purga = "\\c" := by rfl
theorem theoremaExhibitionisAdscribe : SignumExhibitionis.adCatenam .adscribe = "\\C" := by rfl
theorem theoremaExhibitionisLinearisAbrogatur : SignumExhibitionis.adCatenam .linearisAbrogatur = "\\_n" := by rfl

-- フォルマエ (定數にゃ)
theorem theoremaFormaeInhabilis : SignumFormae.adCatenam .formaInhabilis = "\\f[disable]" := by rfl
theorem theoremaFormaePraefinita : SignumFormae.adCatenam .formaPraefinita = "\\f[default]" := by rfl

-- スペルフィキエイ (表面にゃ)
theorem theoremaSuperficieiAbsconde : SignumSuperficiei.adCatenam .superficiesAbsconde = "\\s[-1]" := by rfl

-- ブッラエ (吹出しにゃ)
theorem theoremaBullaeAbsconde : SignumBullae.adCatenam .bullaAbsconde = "\\b[-1]" := by rfl

-- オプティオヌム (選擇肢にゃ)
theorem theoremaOptionumFineOptioScopus : SignumOptionum.adCatenam .fineOptioScopus = "\\__q" := by rfl
theorem theoremaOptionumFineAncora : SignumOptionum.adCatenam .fineAncora = "\\_a" := by rfl

-- ═══════════════════════════════════════════════════════════
-- § 3. Nat/Int パラメートゥルムの全稱證明にゃん♪
-- ═══════════════════════════════════════════════════════════

-- スコピ: persona
theorem theoremaScopiPersonaAdCatenam : ∀ (n : Nat),
  SignumScopi.adCatenam (.persona n) = s!"\\p[{n}]" := by
  intro n; rfl

-- モーラエ: mora
theorem theoremaMoraeMoraAdCatenam : ∀ (ms : Nat),
  SignumMorae.adCatenam (.mora ms) = s!"\\_w[{ms}]" := by
  intro ms; rfl

-- モーラエ: moraCeler (依存型にゃ♪)
theorem theoremaMoraeMoraCelerAdCatenam : ∀ (n : Nat) (h : 1 ≤ n ∧ n ≤ 9),
  SignumMorae.adCatenam (.moraCeler n h) = s!"\\w{n}" := by
  intro n h; rfl

-- モーラエ: moraAbsoluta
theorem theoremaMoraeMoraAbsolutaAdCatenam : ∀ (ms : Nat),
  SignumMorae.adCatenam (.moraAbsoluta ms) = s!"\\__w[{ms}]" := by
  intro ms; rfl

-- モーラエ: moraAnimationem
theorem theoremaMoraeMoraAnimationemAdCatenam : ∀ (id : Nat),
  SignumMorae.adCatenam (.moraAnimationem id) = s!"\\__w[animation,{id}]" := by
  intro id; rfl

-- エクシビティオニス: purgaCharacterem
theorem theoremaExhibitionisPurgaCharacteremAdCatenam : ∀ (n : Nat),
  SignumExhibitionis.adCatenam (.purgaCharacterem n) = s!"\\c[char,{n}]" := by
  intro n; rfl

-- エクシビティオニス: purgaCharacteremAb
theorem theoremaExhibitionisPurgaCharacteremAbAdCatenam : ∀ (n i : Nat),
  SignumExhibitionis.adCatenam (.purgaCharacteremAb n i) = s!"\\c[char,{n},{i}]" := by
  intro n i; rfl

-- エクシビティオニス: purgaLineam
theorem theoremaExhibitionisPurgaLineamAdCatenam : ∀ (n : Nat),
  SignumExhibitionis.adCatenam (.purgaLineam n) = s!"\\c[line,{n}]" := by
  intro n; rfl

-- エクシビティオニス: purgaLineamAb
theorem theoremaExhibitionisPurgaLineamAbAdCatenam : ∀ (n i : Nat),
  SignumExhibitionis.adCatenam (.purgaLineamAb n i) = s!"\\c[line,{n},{i}]" := by
  intro n i; rfl

-- エクシビティオニス: lineaProportionalis
theorem theoremaExhibitionisLineaProportionalisAdCatenam : ∀ (n : Int),
  SignumExhibitionis.adCatenam (.lineaProportionalis n) = s!"\\n[percent,{n}]" := by
  intro n; rfl

-- スペルフィキエイ: superficies
theorem theoremaSuperficieiSuperficiesAdCatenam : ∀ (n : Nat),
  SignumSuperficiei.adCatenam (.superficies n) = s!"\\s[{n}]" := by
  intro n; rfl

-- スペルフィキエイ: animatio
theorem theoremaSuperficieiAnimatioAdCatenam : ∀ (n : Nat),
  SignumSuperficiei.adCatenam (.animatio n) = s!"\\i[{n}]" := by
  intro n; rfl

-- スペルフィキエイ: animatioExpecta
theorem theoremaSuperficieiAnimatioExpectaAdCatenam : ∀ (n : Nat),
  SignumSuperficiei.adCatenam (.animatioExpecta n) = s!"\\i[{n},wait]" := by
  intro n; rfl

-- ブッラエ: bulla
theorem theoremaBullaeBullaAdCatenam : ∀ (n : Nat),
  SignumBullae.adCatenam (.bulla n) = s!"\\b[{n}]" := by
  intro n; rfl

-- オプティオヌム: tempusOptionum
theorem theoremaOptionumTempusOptionumAdCatenam : ∀ (ms : Nat),
  SignumOptionum.adCatenam (.tempusOptionum ms) = s!"\\![set,choicetimeout,{ms}]" := by
  intro ms; rfl

-- ═══════════════════════════════════════════════════════════
-- § 4. adCatenamLista の代數的性質にゃん♪
-- ═══════════════════════════════════════════════════════════

-- 空リストゥスは空文字列にゃ
theorem theoremaListaVacuaAdCatenam : adCatenamLista [] = "" := by rfl

-- 單一要素リストゥスは adCatenam と同じにゃ
theorem theoremaListaSingularisAdCatenam : ∀ (s : Signum),
  adCatenamLista [s] = s.adCatenam := by
  intro s; simp [adCatenamLista, List.map, String.join]

-- foldl アッキュムラートルの補助定理にゃ
private theorem foldl_append_acc (acc : String) (xs : List String) :
  List.foldl (fun r s => r ++ s) acc xs = acc ++ List.foldl (fun r s => r ++ s) "" xs := by
  induction xs generalizing acc with
  | nil => simp
  | cons x xs ih =>
    simp [List.foldl]
    rw [ih (acc ++ x), ih x]
    simp [String.append_assoc]

-- String.join のアッペンド分配性にゃ（補助定理にゃん♪）
private theorem String.join_append (xs ys : List String) :
  String.join (xs ++ ys) = String.join xs ++ String.join ys := by
  simp [String.join]
  induction xs with
  | nil => simp
  | cons x xs ih =>
    simp [List.foldl]
    exact foldl_append_acc _ _

-- リストゥス連結の準同型にゃ（ホモモルフィスムスにゃ♪）
theorem theoremaListaAppendAdCatenam : ∀ (xs ys : List Signum),
  adCatenamLista (xs ++ ys) = adCatenamLista xs ++ adCatenamLista ys := by
  intro xs ys
  simp [adCatenamLista, List.map_append, String.join_append]

-- ═══════════════════════════════════════════════════════════
-- § 5. 遁走函數の全稱證明にゃん♪
-- ═══════════════════════════════════════════════════════════

-- evadeTextus は定義通りに動くにゃ（任意の文字列で成り立つにゃん♪）
theorem theoremaEvadeTextusDefinitio : ∀ (s : String),
    evadeTextus s = s.foldl (fun acc c => match c with
      | '\\' => acc ++ "\\" | '%' => acc ++ "\\%" | ']' => acc ++ "\\]"
      | _ => acc.push c) "" := by
  intro s; rfl

-- evadeArgumentum は定義通りに動くにゃ（任意の文字列で成り立つにゃん♪）
theorem theoremaEvadeArgumentumDefinitio : ∀ (s : String),
    evadeArgumentum s = (
      let s1 := s.foldl (fun acc c => match c with
        | '\\' => acc ++ "\\\\" | ']' => acc ++ "\\]" | '%' => acc ++ "\\%"
        | _ => acc.push c) ""
      if s1.any (fun c => c == ',' || c == '"') then
        "\"" ++ s1.replace "\"" "\"\"" ++ "\""
      else s1) := by
  intro s; rfl

-- ═══════════════════════════════════════════════════════════
-- § 6. 構造的性質の證明にゃん♪（プレフィクスム/スッフィクスムにゃ）
-- ═══════════════════════════════════════════════════════════

-- リストゥスの末尾に c を附けたら [c] がスッフィクスムにゃ（補助定理にゃん♪）
private theorem List.isSuffix_singleton_append {β : Type} (xs : List β) (c : β) :
    [c] <:+ xs ++ [c] := ⟨xs, rfl⟩

-- 全ての SignumScopi の出力は "\\" で始まるにゃ
theorem theoremaScopiAdCatenamPraefixa : ∀ (s : SignumScopi),
    "\\".toList <+: (s.adCatenam).toList := by
  intro s; cases s with
  | sakura => exact ⟨['h'], by native_decide⟩
  | kero => exact ⟨['u'], by native_decide⟩
  | persona n =>
    simp only [SignumScopi.adCatenam, toString]
    simp [String.toList_append]

-- 全ての SignumImperii の出力は "\\" で始まるにゃ
theorem theoremaImperiiAdCatenamPraefixa : ∀ (i : SignumImperii),
    "\\".toList <+: (i.adCatenam).toList := by
  intro i; cases i <;>
    first
    | native_decide
    | (intro b; cases b <;> native_decide)
    | (simp only [SignumImperii.adCatenam, toString]; simp [String.toList_append])

-- 全ての SignumFormae の出力は "\\f[" で始まるにゃ
theorem theoremaFormaeAdCatenamPraefixa : ∀ (f : SignumFormae),
    "\\f[".toList <+: (f.adCatenam).toList := by
  intro f; cases f <;>
    first
    | native_decide
    | (intro b; cases b <;> native_decide)
    | (simp only [SignumFormae.adCatenam, toString]; simp [String.toList_append])

-- 全ての SignumFormae の出力は "]" で終はるにゃ
theorem theoremaFormaeAdCatenamSuffixa : ∀ (f : SignumFormae),
    "]".toList <:+ (f.adCatenam).toList := by
  intro f; cases f <;>
    first
    | native_decide
    | (intro b; cases b <;> native_decide)
    | (simp only [SignumFormae.adCatenam, toString, String.toList_append]
       exact List.isSuffix_singleton_append _ ']')

-- ═══════════════════════════════════════════════════════════
-- § 7. SignumFormae 列挙パラメートゥルムの全稱證明にゃん♪
-- ═══════════════════════════════════════════════════════════

-- DirectioAllineatio の全ケースにゃ
theorem theoremaFormaeAllineatioAdCatenam : ∀ (d : DirectioAllineatio),
  SignumFormae.adCatenam (.allineatio d) = s!"\\f[align,{d.toString}]" := by
  intro d; cases d <;> rfl

-- DirectioVerticalis の全ケースにゃ
theorem theoremaFormaeAllineatioVerticalisAdCatenam : ∀ (d : DirectioVerticalis),
  SignumFormae.adCatenam (.allineatioVerticalis d) = s!"\\f[valign,{d.toString}]" := by
  intro d; cases d <;> rfl

-- StylusUmbrae の全ケースにゃ
theorem theoremaFormaeStylumUmbraeAdCatenam : ∀ (s : StylusUmbrae),
  SignumFormae.adCatenam (.stylumUmbrae s) = s!"\\f[shadowstyle,{s.toString}]" := by
  intro s; cases s <;> rfl

-- StatusContorni の全ケースにゃ
theorem theoremaFormaeContornusAdCatenam : ∀ (p : StatusContorni),
  SignumFormae.adCatenam (.contornus p) = s!"\\f[outline,{p.toString}]" := by
  intro p; cases p <;> rfl

-- Coloris → color の全ケースにゃ
theorem theoremaFormaeColorAdCatenam : ∀ (c : Coloris),
  SignumFormae.adCatenam (.color c) = s!"\\f[color,{c.toString}]" := by
  intro c; cases c <;> rfl

-- MagnitudoLitterarum → altitudoLitterarum の全ケースにゃ
theorem theoremaFormaeAltitudoAdCatenam : ∀ (m : MagnitudoLitterarum),
  SignumFormae.adCatenam (.altitudoLitterarum m) = s!"\\f[height,{m.toString}]" := by
  intro m; cases m <;> rfl

-- Coloris → colorUmbrae の全ケースにゃ
theorem theoremaFormaeColorUmbraeAdCatenam : ∀ (c : Coloris),
  SignumFormae.adCatenam (.colorUmbrae c) = s!"\\f[shadowcolor,{c.toString}]" := by
  intro c; cases c <;> rfl

-- カーソル選擇中: FormaMarci → stylumCursorisElecti にゃ
theorem theoremaFormaeStylumCursorisElectiAdCatenam : ∀ (f : FormaMarci),
  SignumFormae.adCatenam (.stylumCursorisElecti f) = s!"\\f[cursorstyle,{f.toString}]" := by
  intro f; cases f <;> rfl

-- カーソル選擇中: Coloris → colorCursorisElecti にゃ
theorem theoremaFormaeColorCursorisElectiAdCatenam : ∀ (c : Coloris),
  SignumFormae.adCatenam (.colorCursorisElecti c) = s!"\\f[cursorcolor,{c.toString}]" := by
  intro c; cases c <;> rfl

-- カーソル選擇中: Coloris → colorPenicilliCursorisElecti にゃ
theorem theoremaFormaeColorPenicilliCursorisElectiAdCatenam : ∀ (c : Coloris),
  SignumFormae.adCatenam (.colorPenicilliCursorisElecti c) = s!"\\f[cursorbrushcolor,{c.toString}]" := by
  intro c; cases c <;> rfl

-- カーソル選擇中: Coloris → colorCalamCursorisElecti にゃ
theorem theoremaFormaeColorCalamCursorisElectiAdCatenam : ∀ (c : Coloris),
  SignumFormae.adCatenam (.colorCalamCursorisElecti c) = s!"\\f[cursorpencolor,{c.toString}]" := by
  intro c; cases c <;> rfl

-- カーソル選擇中: Coloris → colorFontisCursorisElecti にゃ
theorem theoremaFormaeColorFontisCursorisElectiAdCatenam : ∀ (c : Coloris),
  SignumFormae.adCatenam (.colorFontisCursorisElecti c) = s!"\\f[cursorfontcolor,{c.toString}]" := by
  intro c; cases c <;> rfl

-- カーソル選擇中: MethodusMarci → methodusCursorisElecti にゃ
theorem theoremaFormaeMethodusCursorisElectiAdCatenam : ∀ (m : MethodusMarci),
  SignumFormae.adCatenam (.methodusCursorisElecti m) = s!"\\f[cursormethod,{m.toString}]" := by
  intro m; cases m <;> rfl

-- カーソル未選擇: FormaMarci → stylumCursorisNonElecti にゃ
theorem theoremaFormaeStylumCursorisNonElectiAdCatenam : ∀ (f : FormaMarci),
  SignumFormae.adCatenam (.stylumCursorisNonElecti f) = s!"\\f[cursornotselectstyle,{f.toString}]" := by
  intro f; cases f <;> rfl

-- カーソル未選擇: Coloris → colorCursorisNonElecti にゃ
theorem theoremaFormaeColorCursorisNonElectiAdCatenam : ∀ (c : Coloris),
  SignumFormae.adCatenam (.colorCursorisNonElecti c) = s!"\\f[cursornotselectcolor,{c.toString}]" := by
  intro c; cases c <;> rfl

-- カーソル未選擇: Coloris → colorPenicilliCursorisNonElecti にゃ
theorem theoremaFormaeColorPenicilliCursorisNonElectiAdCatenam : ∀ (c : Coloris),
  SignumFormae.adCatenam (.colorPenicilliCursorisNonElecti c) = s!"\\f[cursornotselectbrushcolor,{c.toString}]" := by
  intro c; cases c <;> rfl

-- カーソル未選擇: Coloris → colorCalamCursorisNonElecti にゃ
theorem theoremaFormaeColorCalamCursorisNonElectiAdCatenam : ∀ (c : Coloris),
  SignumFormae.adCatenam (.colorCalamCursorisNonElecti c) = s!"\\f[cursornotselectpencolor,{c.toString}]" := by
  intro c; cases c <;> rfl

-- カーソル未選擇: Coloris → colorFontisCursorisNonElecti にゃ
theorem theoremaFormaeColorFontisCursorisNonElectiAdCatenam : ∀ (c : Coloris),
  SignumFormae.adCatenam (.colorFontisCursorisNonElecti c) = s!"\\f[cursornotselectfontcolor,{c.toString}]" := by
  intro c; cases c <;> rfl

-- カーソル未選擇: MethodusMarci → methodusCursorisNonElecti にゃ
theorem theoremaFormaeMethodusCursorisNonElectiAdCatenam : ∀ (m : MethodusMarci),
  SignumFormae.adCatenam (.methodusCursorisNonElecti m) = s!"\\f[cursornotselectmethod,{m.toString}]" := by
  intro m; cases m <;> rfl

-- 錨フォントゥス色: Coloris → colorFontisAncorae にゃ
theorem theoremaFormaeColorFontisAncoraeAdCatenam : ∀ (c : Coloris),
  SignumFormae.adCatenam (.colorFontisAncorae c) = s!"\\f[anchor.font.color,{c.toString}]" := by
  intro c; cases c <;> rfl

-- 錨選擇中: FormaMarci → stylumAncorae にゃ
theorem theoremaFormaeStylumAncoraAdCatenam : ∀ (f : FormaMarci),
  SignumFormae.adCatenam (.stylumAncorae f) = s!"\\f[anchorstyle,{f.toString}]" := by
  intro f; cases f <;> rfl

-- 錨選擇中: Coloris → colorAncorae にゃ
theorem theoremaFormaeColorAncoraAdCatenam : ∀ (c : Coloris),
  SignumFormae.adCatenam (.colorAncorae c) = s!"\\f[anchorcolor,{c.toString}]" := by
  intro c; cases c <;> rfl

-- 錨選擇中: Coloris → colorPenicilliAncorae にゃ
theorem theoremaFormaeColorPenicilliAncoraAdCatenam : ∀ (c : Coloris),
  SignumFormae.adCatenam (.colorPenicilliAncorae c) = s!"\\f[anchorbrushcolor,{c.toString}]" := by
  intro c; cases c <;> rfl

-- 錨選擇中: Coloris → colorCalamAncorae にゃ
theorem theoremaFormaeColorCalamAncoraAdCatenam : ∀ (c : Coloris),
  SignumFormae.adCatenam (.colorCalamAncorae c) = s!"\\f[anchorpencolor,{c.toString}]" := by
  intro c; cases c <;> rfl

-- 錨選擇中: Coloris → colorFontisAncoraeTotae にゃ
theorem theoremaFormaeColorFontisAncoraeTotaeAdCatenam : ∀ (c : Coloris),
  SignumFormae.adCatenam (.colorFontisAncoraeTotae c) = s!"\\f[anchorfontcolor,{c.toString}]" := by
  intro c; cases c <;> rfl

-- 錨選擇中: MethodusMarci → methodusAncorae にゃ
theorem theoremaFormaeMethodusAncoraAdCatenam : ∀ (m : MethodusMarci),
  SignumFormae.adCatenam (.methodusAncorae m) = s!"\\f[anchormethod,{m.toString}]" := by
  intro m; cases m <;> rfl

-- 錨未選擇: FormaMarci → stylumAncoraeNonElectae にゃ
theorem theoremaFormaeStylumAncoraeNonElectaeAdCatenam : ∀ (f : FormaMarci),
  SignumFormae.adCatenam (.stylumAncoraeNonElectae f) = s!"\\f[anchornotselectstyle,{f.toString}]" := by
  intro f; cases f <;> rfl

-- 錨未選擇: Coloris → colorAncoraeNonElectae にゃ
theorem theoremaFormaeColorAncoraeNonElectaeAdCatenam : ∀ (c : Coloris),
  SignumFormae.adCatenam (.colorAncoraeNonElectae c) = s!"\\f[anchornotselectcolor,{c.toString}]" := by
  intro c; cases c <;> rfl

-- 錨未選擇: Coloris → colorPenicilliAncoraeNonElectae にゃ
theorem theoremaFormaeColorPenicilliAncoraeNonElectaeAdCatenam : ∀ (c : Coloris),
  SignumFormae.adCatenam (.colorPenicilliAncoraeNonElectae c) = s!"\\f[anchornotselectbrushcolor,{c.toString}]" := by
  intro c; cases c <;> rfl

-- 錨未選擇: Coloris → colorCalamAncoraeNonElectae にゃ
theorem theoremaFormaeColorCalamAncoraeNonElectaeAdCatenam : ∀ (c : Coloris),
  SignumFormae.adCatenam (.colorCalamAncoraeNonElectae c) = s!"\\f[anchornotselectpencolor,{c.toString}]" := by
  intro c; cases c <;> rfl

-- 錨未選擇: Coloris → colorFontisAncoraeNonElectae にゃ
theorem theoremaFormaeColorFontisAncoraeNonElectaeAdCatenam : ∀ (c : Coloris),
  SignumFormae.adCatenam (.colorFontisAncoraeNonElectae c) = s!"\\f[anchornotselectfontcolor,{c.toString}]" := by
  intro c; cases c <;> rfl

-- 錨未選擇: MethodusMarci → methodusAncoraeNonElectae にゃ
theorem theoremaFormaeMethodusAncoraeNonElectaeAdCatenam : ∀ (m : MethodusMarci),
  SignumFormae.adCatenam (.methodusAncoraeNonElectae m) = s!"\\f[anchornotselectmethod,{m.toString}]" := by
  intro m; cases m <;> rfl

-- 錨訪問濟み: FormaMarci → stylumAncoraeVisae にゃ
theorem theoremaFormaeStylumAncoraeVisaeAdCatenam : ∀ (f : FormaMarci),
  SignumFormae.adCatenam (.stylumAncoraeVisae f) = s!"\\f[anchorvisitedstyle,{f.toString}]" := by
  intro f; cases f <;> rfl

-- 錨訪問濟み: Coloris → colorAncoraeVisae にゃ
theorem theoremaFormaeColorAncoraeVisaeAdCatenam : ∀ (c : Coloris),
  SignumFormae.adCatenam (.colorAncoraeVisae c) = s!"\\f[anchorvisitedcolor,{c.toString}]" := by
  intro c; cases c <;> rfl

-- 錨訪問濟み: Coloris → colorPenicilliAncoraeVisae にゃ
theorem theoremaFormaeColorPenicilliAncoraeVisaeAdCatenam : ∀ (c : Coloris),
  SignumFormae.adCatenam (.colorPenicilliAncoraeVisae c) = s!"\\f[anchorvisitedbrushcolor,{c.toString}]" := by
  intro c; cases c <;> rfl

-- 錨訪問濟み: Coloris → colorCalamAncoraeVisae にゃ
theorem theoremaFormaeColorCalamAncoraeVisaeAdCatenam : ∀ (c : Coloris),
  SignumFormae.adCatenam (.colorCalamAncoraeVisae c) = s!"\\f[anchorvisitedpencolor,{c.toString}]" := by
  intro c; cases c <;> rfl

-- 錨訪問濟み: Coloris → colorFontisAncoraeVisae にゃ
theorem theoremaFormaeColorFontisAncoraeVisaeAdCatenam : ∀ (c : Coloris),
  SignumFormae.adCatenam (.colorFontisAncoraeVisae c) = s!"\\f[anchorvisitedfontcolor,{c.toString}]" := by
  intro c; cases c <;> rfl

-- 錨訪問濟み: MethodusMarci → methodusAncoraeVisae にゃ
theorem theoremaFormaeMethodusAncoraeVisaeAdCatenam : ∀ (m : MethodusMarci),
  SignumFormae.adCatenam (.methodusAncoraeVisae m) = s!"\\f[anchorvisitedmethod,{m.toString}]" := by
  intro m; cases m <;> rfl

-- String パラメートゥルム: nomenFontis にゃ
theorem theoremaFormaeNomenFontisAdCatenam : ∀ (s : String),
  SignumFormae.adCatenam (.nomenFontis s) = s!"\\f[name,{evadeArgumentum s}]" := by
  intro s; rfl

-- ═══════════════════════════════════════════════════════════
-- § 8. 殘りシグヌムカテゴリの全稱證明にゃん♪
-- ═══════════════════════════════════════════════════════════

-- ── Fenestrae (窓制御にゃ) ──

-- 移動にゃん
theorem theoremaFenestraeMovereadCatenam : ∀ (sx sy kx ky : Int),
  SignumFenestrae.adCatenam (.movere sx sy kx ky) = s!"\\![move,{sx},{sy},{kx},{ky}]" := by
  intro sx sy kx ky; rfl

theorem theoremaFenestraeMovereadAsyncAdCatenam : ∀ (sx sy kx ky : Int),
  SignumFenestrae.adCatenam (.movereAsync sx sy kx ky) = s!"\\![moveasync,{sx},{sy},{kx},{ky}]" := by
  intro sx sy kx ky; rfl

theorem theoremaFenestraeCancellaMotumAsyncAdCatenam :
  SignumFenestrae.adCatenam .cancellaMotumAsync = "\\![moveasync,cancel]" := by rfl

-- ロック・アンロックにゃん
theorem theoremaFenestraeSeraRepicturaAdCatenam :
  SignumFenestrae.adCatenam .seraRepictura = "\\![lock,repaint]" := by rfl

theorem theoremaFenestraeReseraRepicturaAdCatenam :
  SignumFenestrae.adCatenam .reseraRepictura = "\\![unlock,repaint]" := by rfl

theorem theoremaFenestraeSeraRepicturaBullaeAdCatenam :
  SignumFenestrae.adCatenam .seraRepicturaBullae = "\\![lock,balloonrepaint]" := by rfl

theorem theoremaFenestraeReseraRepicturaBullaeAdCatenam :
  SignumFenestrae.adCatenam .reseraRepicturaBullae = "\\![unlock,balloonrepaint]" := by rfl

theorem theoremaFenestraeSeraRepicturaManualiterAdCatenam :
  SignumFenestrae.adCatenam .seraRepicturaManualiter = "\\![lock,repaint,manual]" := by rfl

theorem theoremaFenestraeSeraRepicturaBullaeManualiterAdCatenam :
  SignumFenestrae.adCatenam .seraRepicturaBullaeManualiter = "\\![lock,balloonrepaint,manual]" := by rfl

theorem theoremaFenestraeSeraMotusBullaeAdCatenam :
  SignumFenestrae.adCatenam .seraMotusBullae = "\\![lock,balloonmove]" := by rfl

theorem theoremaFenestraeReseraMotusBullaeAdCatenam :
  SignumFenestrae.adCatenam .reseraMotusBullae = "\\![unlock,balloonmove]" := by rfl

-- 可視性にゃん
theorem theoremaFenestraeVanescoAdCatenam :
  SignumFenestrae.adCatenam .vanesco = "\\![vanish]" := by rfl

-- 設定にゃん (Bool パラメートゥルムにゃ)
theorem theoremaFenestraeAutoScrollAdCatenam : ∀ (b : Bool),
  SignumFenestrae.adCatenam (.configuraAutoScroll b) = s!"\\![set,autoscroll,{if b then "on" else "off"}]" := by
  intro b; cases b <;> rfl

theorem theoremaFenestraeSessioRapidaAdCatenam : ∀ (b : Bool),
  SignumFenestrae.adCatenam (.sessioRapida b) = s!"\\![quicksession,{if b then "true" else "false"}]" := by
  intro b; cases b <;> rfl

theorem theoremaFenestraeZoomAdCatenam : ∀ (n : Nat),
  SignumFenestrae.adCatenam (.zoom n) = s!"\\z[{n}]" := by
  intro n; rfl

theorem theoremaFenestraeAllineatioBullaeAdCatenam : ∀ (d : DirectioAllineatioBullae),
  SignumFenestrae.adCatenam (.allineatioBullae d) = s!"\\![set,balloonalign,{d.toString}]" := by
  intro d; cases d <;> rfl

theorem theoremaFenestraeTempusBullaeAdCatenam : ∀ (ms : Nat),
  SignumFenestrae.adCatenam (.tempusBullae ms) = s!"\\![set,balloontimeout,{ms}]" := by
  intro ms; rfl

theorem theoremaFenestraeMoraTextusAdCatenam : ∀ (p : Nat),
  SignumFenestrae.adCatenam (.moraTextus p) = s!"\\![set,balloonwait,{p}]" := by
  intro p; rfl

theorem theoremaFenestraeConfiguraSerikoOsAdCatenam : ∀ (b : Bool),
  SignumFenestrae.adCatenam (.configuraSerikoOs b) = s!"\\![set,serikotalk,{if b then "true" else "false"}]" := by
  intro b; cases b <;> rfl

theorem theoremaFenestraeOstendeMarcamAdCatenam :
  SignumFenestrae.adCatenam .ostendeMarcam = "\\![*]" := by rfl

theorem theoremaFenestraeRenovaPositionemBullaeAdCatenam :
  SignumFenestrae.adCatenam .renovaPositionemBullae = "\\![execute,resetballoonpos]" := by rfl

theorem theoremaFenestraeSignatumBullaeAdCatenam : ∀ (sig : String),
  SignumFenestrae.adCatenam (.signatumBullae sig) = s!"\\![set,balloonmarker,{evadeArgumentum sig}]" := by
  intro sig; rfl

theorem theoremaFenestraeOrdoFenestrarumAdCatenam : ∀ (ids : List Nat),
  SignumFenestrae.adCatenam (.ordoFenestrarum ids) = s!"\\![set,zorder,{",".intercalate (ids.map toString)}]" := by
  intro ids; rfl

theorem theoremaFenestraeMargosBullaeAdCatenam : ∀ (l t r b : Int),
  SignumFenestrae.adCatenam (.margosBullae l t r b) = s!"\\![set,balloonpadding,{l},{t},{r},{b}]" := by
  intro l t r b; rfl

-- 動作設定にゃん (Bool パラメートゥルムにゃ)
theorem theoremaFenestraeNictatusAdCatenam : ∀ (b : Bool),
  SignumFenestrae.adCatenam (.nictatus b) = s!"\\![set,blink,{if b then "on" else "off"}]" := by
  intro b; cases b <;> rfl

theorem theoremaFenestraeSemperSupraAdCatenam : ∀ (b : Bool),
  SignumFenestrae.adCatenam (.semperSupra b) = s!"\\![set,alwaysontop,{if b then "true" else "false"}]" := by
  intro b; cases b <;> rfl

theorem theoremaFenestraeTabellaeTascaeAdCatenam : ∀ (m : Bool),
  SignumFenestrae.adCatenam (.tabellaTascae m) = s!"\\![set,taskbar,{if m then "show" else "hide"}]" := by
  intro m; cases m <;> rfl

theorem theoremaFenestraeTractusWindowaeAdCatenam : ∀ (b : Bool),
  SignumFenestrae.adCatenam (.tractusWindowae b) = s!"\\![set,windowdragging,{if b then "on" else "off"}]" := by
  intro b; cases b <;> rfl

-- 開閉にゃん (列挙パラメートゥルムにゃ)
theorem theoremaFenestraeClaudeAdCatenam : ∀ (f : FenestraClaudibilis),
  SignumFenestrae.adCatenam (.claude f) = s!"\\![close,{f.toString}]" := by
  intro f; cases f <;> rfl

-- 窓状態にゃん
theorem theoremaFenestraeStatusFenestraeAdCatenam : ∀ (st : StatusFenestrae),
  SignumFenestrae.adCatenam (.configuraStatusFenestrae st) = s!"\\![set,windowstate,{st.toString}]" := by
  intro st; cases st <;> rfl

theorem theoremaFenestraeAllineatioDesktopAdCatenam : ∀ (d : DirectioDesktop),
  SignumFenestrae.adCatenam (.allineatioDesktop d) = s!"\\![set,alignmentondesktop,{d.toString}]" := by
  intro d; cases d <;> rfl

theorem theoremaFenestraeConfiguratioScalaeAdCatenam : ∀ (p : Int),
  SignumFenestrae.adCatenam (.configuratioScalae p) = s!"\\![set,scaling,{p}]" := by
  intro p; rfl

theorem theoremaFenestraeConfiguratioAlphaeAdCatenam : ∀ (v : Nat) (h : v ≤ 100),
  SignumFenestrae.adCatenam (.configuratioAlphae v h) = s!"\\![set,alpha,{v}]" := by
  intro v h; rfl

theorem theoremaFenestraeConfiguraPositionemAdCatenam : ∀ (x y : Int) (sc : Nat),
  SignumFenestrae.adCatenam (.configuraPositionem x y sc) = s!"\\![set,position,{x},{y},{sc}]" := by
  intro x y sc; rfl

theorem theoremaFenestraeReseraPositionemAdCatenam :
  SignumFenestrae.adCatenam .reseraPositionem = "\\![reset,position]" := by rfl

theorem theoremaFenestraeReseraOrdoFenestrarumAdCatenam :
  SignumFenestrae.adCatenam .reseraOrdoFenestrarum = "\\![reset,zorder]" := by rfl

theorem theoremaFenestraeConfiguraStickyWindowAdCatenam : ∀ (ids : List Nat),
  SignumFenestrae.adCatenam (.configuraStickyWindow ids) = s!"\\![set,sticky-window,{",".intercalate (ids.map toString)}]" := by
  intro ids; rfl

theorem theoremaFenestraeResetStickyWindowAdCatenam :
  SignumFenestrae.adCatenam .resetStickyWindow = "\\![reset,sticky-window]" := by rfl

theorem theoremaFenestraeRenovaPositionemWindowaeAdCatenam :
  SignumFenestrae.adCatenam .renovaPositionemWindowae = "\\![execute,resetwindowpos]" := by rfl

-- トレイ・エディタにゃん
theorem theoremaFenestraeConfiguraTascamIconAdCatenam : ∀ (v t o : String),
  SignumFenestrae.adCatenam (.configuraTascamIcon v t o) = s!"\\![set,tasktrayicon,{evadeArgumentum v},{evadeArgumentum t},{evadeArgumentum o}]" := by
  intro v t o; rfl

theorem theoremaFenestraeConfiguraTascamBullamAdCatenam : ∀ (o : String),
  SignumFenestrae.adCatenam (.configuraTascamBullam o) = s!"\\![set,trayballoon,{evadeArgumentum o}]" := by
  intro o; rfl

theorem theoremaFenestraeAperiEditoremAdCatenam : ∀ (v : String) (l : Nat),
  SignumFenestrae.adCatenam (.aperiEditorem v l) = s!"\\![open,editor,{evadeArgumentum v},{l}]" := by
  intro v l; rfl

-- スケーリング・透明度拡張にゃん
theorem theoremaFenestraeConfiguraScalamDualemAdCatenam : ∀ (x y : Int),
  SignumFenestrae.adCatenam (.configuraScalamDualem x y) = s!"\\![set,scaling,{x},{y}]" := by
  intro x y; rfl

-- 吹出し拡張2にゃん
theorem theoremaFenestraeConfiguraBullaeNumerumAdCatenam : ∀ (n : String) (nu mx : Nat),
  SignumFenestrae.adCatenam (.configuraBullaeNumerum n nu mx) = s!"\\![set,balloonnum,{evadeArgumentum n},{nu},{mx}]" := by
  intro n nu mx; rfl

-- 設定: configuraBullaeOffset にゃん (列挙パラメートゥルムにゃ)
theorem theoremaFenestraeConfiguraBullaeOffsetAdCatenam : ∀ (sc : ScopusBullae) (x y : Int),
  SignumFenestrae.adCatenam (.configuraBullaeOffset sc x y) = s!"\\![set,balloonoffset,{sc.toString},{x},{y}]" := by
  intro sc x y; cases sc <;> rfl

-- ── Modorum (モード制御にゃ) ──

-- 定數コンストゥルクトルにゃん
theorem theoremaModorumIngredereModumPassivumAdCatenam :
  SignumModorum.adCatenam .ingredereModumPassivum = "\\![enter,passivemode]" := by rfl

theorem theoremaModorumEgrediereModumPassivumAdCatenam :
  SignumModorum.adCatenam .egrediereModumPassivum = "\\![leave,passivemode]" := by rfl

theorem theoremaModorumIngredereModumOnlineAdCatenam :
  SignumModorum.adCatenam .ingredereModumOnline = "\\![enter,onlinemode]" := by rfl

theorem theoremaModorumEgrediereModumOnlineAdCatenam :
  SignumModorum.adCatenam .egrediereModumOnline = "\\![leave,onlinemode]" := by rfl

theorem theoremaModorumEgrediereStickyAdCatenam :
  SignumModorum.adCatenam .egrediereSticky = "\\![leave,sticky]" := by rfl

theorem theoremaModorumIngrederePositionemDomesticamAdCatenam :
  SignumModorum.adCatenam .ingrederePositionemDomesticam = "\\![enter,homeposition]" := by rfl

theorem theoremaModorumEgredierePositionemDomesticamAdCatenam :
  SignumModorum.adCatenam .egredierePositionemDomesticam = "\\![leave,homeposition]" := by rfl

theorem theoremaModorumIngredereModumInductivumAdCatenam :
  SignumModorum.adCatenam .ingredereModumInductivum = "\\![enter,inductionmode]" := by rfl

theorem theoremaModorumEgrediereModumInductivumAdCatenam :
  SignumModorum.adCatenam .egrediereModumInductivum = "\\![leave,inductionmode]" := by rfl

theorem theoremaModorumIngredereModumCollisionisAdCatenam : ∀ (rectus : Bool),
  SignumModorum.adCatenam (.ingredereModumCollisionis rectus) =
    if rectus then "\\![enter,collisionmode,rect]" else "\\![enter,collisionmode]" := by
  intro rectus; cases rectus <;> rfl

theorem theoremaModorumEgrediereModumCollisionisAdCatenam :
  SignumModorum.adCatenam .egrediereModumCollisionis = "\\![leave,collisionmode]" := by rfl

theorem theoremaModorumIngredereModumSelectionisAdCatenam : ∀ (m : ModusSelectionis) (c : String),
  SignumModorum.adCatenam (.ingredereModumSelectionis m c) = s!"\\![enter,selectmode,{m.toString},{evadeArgumentum c}]" := by
  intro m c; cases m <;> rfl

theorem theoremaModorumEgrediereModumSelectionisAdCatenam :
  SignumModorum.adCatenam .egrediereModumSelectionis = "\\![leave,selectmode]" := by rfl

theorem theoremaModorumIngredereModumNonInterruptumAdCatenam :
  SignumModorum.adCatenam .ingredereModumNonInterruptum = "\\![enter,nouserbreakmode]" := by rfl

theorem theoremaModorumEgrediereModumNonInterruptumAdCatenam :
  SignumModorum.adCatenam .egrediereModumNonInterruptum = "\\![leave,nouserbreakmode]" := by rfl

-- ── Mutationis (變更・再讀込にゃ) ──

-- 定數コンストゥルクトルにゃん
theorem theoremaMutationisRenovaGhostAdCatenam :
  SignumMutationis.adCatenam .renovaGhost = "\\![reboot]" := by rfl

theorem theoremaMutationisRenovaAdCatenam : ∀ (sc : ScopusRenovationis),
  SignumMutationis.adCatenam (.renova sc) = s!"\\![reload,{sc.toString}]" := by
  intro sc; cases sc <;> rfl

theorem theoremaMutationisRenovaSuperficiemAdCatenam :
  SignumMutationis.adCatenam .renovaSuperficiem = "\\![reloadsurface]" := by rfl

theorem theoremaMutationisExpelleShioriAdCatenam :
  SignumMutationis.adCatenam .expelleShiori = "\\![unload,shiori]" := by rfl

theorem theoremaMutationisExpelleMakotoAdCatenam :
  SignumMutationis.adCatenam .expelleMakoto = "\\![unload,makoto]" := by rfl

theorem theoremaMutationisOneraSHIORIAdCatenam :
  SignumMutationis.adCatenam .oneraSHIORI = "\\![load,shiori]" := by rfl

theorem theoremaMutationisOneraMakotoAdCatenam :
  SignumMutationis.adCatenam .oneraMakoto = "\\![load,makoto]" := by rfl

theorem theoremaMutationisConfiguraShioriDebugAdCatenam :
  SignumMutationis.adCatenam .configuraShioriDebug = "\\![set,shioridebugmode]" := by rfl

-- ── Soni (音聲にゃ) ──

-- 定數コンストゥルクトルにゃん
theorem theoremaSoniExpectaSonumAdCatenam :
  SignumSoni.adCatenam .expectaSonum = "\\_V" := by rfl

theorem theoremaSoniExpectaSonumPulsusAdCatenam :
  SignumSoni.adCatenam .expectaSonumPulsus = "\\![sound,wait]" := by rfl

-- String パラメートゥルムにゃん
theorem theoremaSoniSonusAdCatenam : ∀ (via : String),
  SignumSoni.adCatenam (.sonus via) = s!"\\_v[{evadeArgumentum via}]" := by
  intro via; rfl

theorem theoremaSoniSonus8AdCatenam : ∀ (via : String),
  SignumSoni.adCatenam (.sonus8 via) = s!"\\8[{evadeArgumentum via}]" := by
  intro via; rfl

theorem theoremaSoniSonusOrbitansAdCatenam : ∀ (via : String),
  SignumSoni.adCatenam (.sonusOrbitans via) = s!"\\![sound,loop,{evadeArgumentum via}]" := by
  intro via; rfl

theorem theoremaSoniSonusInterrumpitAdCatenam : ∀ (via : String),
  SignumSoni.adCatenam (.sonusInterrumpit via) = s!"\\![sound,stop,{evadeArgumentum via}]" := by
  intro via; rfl

theorem theoremaSoniSonusPausatAdCatenam : ∀ (via : String),
  SignumSoni.adCatenam (.sonusPausat via) = s!"\\![sound,pause,{evadeArgumentum via}]" := by
  intro via; rfl

theorem theoremaSoniSonusContinuatAdCatenam : ∀ (via : String),
  SignumSoni.adCatenam (.sonusContinuat via) = s!"\\![sound,resume,{evadeArgumentum via}]" := by
  intro via; rfl

-- Nat パラメートゥルムにゃん
theorem theoremaSoniSonusCDAdCatenam : ∀ (track : Nat),
  SignumSoni.adCatenam (.sonusCD track) = s!"\\![sound,cdplay,{track}]" := by
  intro track; rfl

-- 音聲合成にゃん
theorem theoremaSoniSynthesisVocisAdCatenam : ∀ (opt : String),
  SignumSoni.adCatenam (.synthesisVocis opt) = s!"\\__v[{evadeArgumentum opt}]" := by
  intro opt; rfl

-- ── Retis (通信・ファイル操作にゃ) ──

-- 定數コンストゥルクトルにゃん
theorem theoremaRetisExecutaSNTPAdCatenam :
  SignumRetis.adCatenam .executaSNTP = "\\![executesntp]" := by rfl

theorem theoremaRetisExecutaCreationemUpdateDataAdCatenam :
  SignumRetis.adCatenam .executaCreationemUpdateData = "\\![execute,createupdatedata]" := by rfl

theorem theoremaRetisExecutaCreationemNarAdCatenam :
  SignumRetis.adCatenam .executaCreationemNar = "\\![execute,createnar]" := by rfl

theorem theoremaRetisEvacuaRecyclatoriumAdCatenam :
  SignumRetis.adCatenam .evacuaRecyclatorium = "\\![execute,emptyrecyclebin]" := by rfl

-- String パラメートゥルムにゃん
theorem theoremaRetisExecutaHeadlineAdCatenam : ∀ (nm : String),
  SignumRetis.adCatenam (.executaHeadline nm) = s!"\\![execute,headline,{evadeArgumentum nm}]" := by
  intro nm; rfl

-- List String パラメートゥルムにゃん
theorem theoremaRetisExecutaNslookupAdCatenam : ∀ (ps : List String),
  SignumRetis.adCatenam (.executaNslookup ps) = s!"\\![execute,nslookup,{",".intercalate (ps.map evadeArgumentum)}]" := by
  intro ps; rfl

theorem theoremaRetisExecutaPingAdCatenam : ∀ (ps : List String),
  SignumRetis.adCatenam (.executaPing ps) = s!"\\![execute,ping,{",".intercalate (ps.map evadeArgumentum)}]" := by
  intro ps; rfl

-- 複數パラメートゥルムにゃん
theorem theoremaRetisExecutaInstallationemUrlAdCatenam : ∀ (nx ty : String),
  SignumRetis.adCatenam (.executaInstallationemUrl nx ty) = s!"\\![execute,install,url,{evadeArgumentum nx},{evadeArgumentum ty}]" := by
  intro nx ty; rfl

theorem theoremaRetisExecutaInstallationemViaAdCatenam : ∀ (v : String),
  SignumRetis.adCatenam (.executaInstallationemVia v) = s!"\\![execute,install,path,{evadeArgumentum v}]" := by
  intro v; rfl

theorem theoremaRetisExecutaDumpSuperficieiAdCatenam : ∀ (dir : String) (sc : Nat) (li pr ev : String) (z : Bool),
  SignumRetis.adCatenam (.executaDumpSuperficiei dir sc li pr ev z) =
    s!"\\![execute,dumpsurface,{evadeArgumentum dir},{sc},{evadeArgumentum li},{evadeArgumentum pr},{evadeArgumentum ev},{if z then "1" else "0"}]" := by
  intro dir sc li pr ev z; cases z <;> rfl

-- ── Animationis (動畫にゃ) ──

theorem theoremaAnimationisAnimaIncepitAdCatenam : ∀ (scopus id : Nat),
  SignumAnimationis.adCatenam (.animaIncepit scopus id) = s!"\\![anim,start,{scopus},{id}]" := by
  intro scopus id; rfl

theorem theoremaAnimationisAnimaDesinitAdCatenam : ∀ (scopus id : Nat),
  SignumAnimationis.adCatenam (.animaDesinit scopus id) = s!"\\![anim,stop,{scopus},{id}]" := by
  intro scopus id; rfl

theorem theoremaAnimationisAnimaPausatAdCatenam : ∀ (scopus id : Nat),
  SignumAnimationis.adCatenam (.animaPausat scopus id) = s!"\\![anim,pause,{scopus},{id}]" := by
  intro scopus id; rfl

theorem theoremaAnimationisAnimaContinuatAdCatenam : ∀ (scopus id : Nat),
  SignumAnimationis.adCatenam (.animaContinuat scopus id) = s!"\\![anim,resume,{scopus},{id}]" := by
  intro scopus id; rfl

theorem theoremaAnimationisAnimaPurgatAdCatenam : ∀ (scopus id : Nat),
  SignumAnimationis.adCatenam (.animaPurgat scopus id) = s!"\\![anim,clear,{scopus},{id}]" := by
  intro scopus id; rfl

theorem theoremaAnimationisAnimaOperaturAdCatenam : ∀ (scopus id : Nat),
  SignumAnimationis.adCatenam (.animaOperatur scopus id) = s!"\\![anim,playing,{scopus},{id}]" := by
  intro scopus id; rfl

theorem theoremaAnimationisAnimaTranslatioAdCatenam : ∀ (scopus id : Nat) (x y : Int),
  SignumAnimationis.adCatenam (.animaTranslatio scopus id x y) = s!"\\![anim,offset,{scopus},{id},{x},{y}]" := by
  intro scopus id x y; rfl

theorem theoremaAnimationisAnimaAddOverlayAdCatenam : ∀ (animId : Nat),
  SignumAnimationis.adCatenam (.animaAddOverlay animId) = s!"\\![anim,add,overlay,{animId}]" := by
  intro animId; rfl

theorem theoremaAnimationisAnimaAddOverlayPosAdCatenam : ∀ (animId : Nat) (x y : Int),
  SignumAnimationis.adCatenam (.animaAddOverlayPos animId x y) = s!"\\![anim,add,overlay,{animId},{x},{y}]" := by
  intro animId x y; rfl

theorem theoremaAnimationisAnimaAddBaseAdCatenam : ∀ (animId : Nat),
  SignumAnimationis.adCatenam (.animaAddBase animId) = s!"\\![anim,add,base,{animId}]" := by
  intro animId; rfl

theorem theoremaAnimationisAnimaAddMoveAdCatenam : ∀ (x y : Int),
  SignumAnimationis.adCatenam (.animaAddMove x y) = s!"\\![anim,add,move,{x},{y}]" := by
  intro x y; rfl

theorem theoremaAnimationisAnimaAddOverlayFastAdCatenam : ∀ (animId : Nat),
  SignumAnimationis.adCatenam (.animaAddOverlayFast animId) = s!"\\![anim,add,overlayfast,{animId}]" := by
  intro animId; rfl

-- ── Eventuum (事象にゃ) ──
-- 空リストゥス版は一部 rfl が通らにゃいので § 8b の全稱版に委ねるにゃ

-- ── Proprietatis (プロパティにゃ) ──

-- 定數コンストゥルクトルにゃん
theorem theoremaProprietatisRenovaPlatformamAdCatenam :
  SignumProprietatis.adCatenam .renovaPlatformam = "\\![update,platform]" := by rfl

theorem theoremaProprietatisCreaViamAdCatenam :
  SignumProprietatis.adCatenam .creaViam = "\\![create,shortcut]" := by rfl

-- String パラメートゥルムにゃん
theorem theoremaProprietatisVariabilisAmbientisAdCatenam : ∀ (n : String),
  SignumProprietatis.adCatenam (.variabilisAmbientis n) = s!"%{n}" := by
  intro n; rfl

-- 列挙パラメートゥルムにゃん
theorem theoremaProprietatisConfiguraAliosGhostesAdCatenam : ∀ (m : ModusGhostAlieni),
  SignumProprietatis.adCatenam (.configuraAliosGhostes m) = s!"\\![set,otherghosttalk,{m.toString}]" := by
  intro m; cases m <;> rfl

theorem theoremaProprietatisConfiguraAliasSuperficiesAdCatenam : ∀ (b : Bool),
  SignumProprietatis.adCatenam (.configuraAliasSuperficies b) = s!"\\![set,othersurfacechange,{if b then "true" else "false"}]" := by
  intro b; cases b <;> rfl

-- 效果・フィルトルムにゃん
theorem theoremaProprietatisApplicaEffectumAdCatenam : ∀ (pl : String) (sp : Nat) (pa : String),
  SignumProprietatis.adCatenam (.applicaEffectum pl sp pa) = s!"\\![effect,{evadeArgumentum pl},{sp},{evadeArgumentum pa}]" := by
  intro pl sp pa; rfl

theorem theoremaProprietatisApplicaEffectum2AdCatenam : ∀ (aid : Nat) (pl : String) (sp : Nat) (pa : String),
  SignumProprietatis.adCatenam (.applicaEffectum2 aid pl sp pa) = s!"\\![effect2,{aid},{evadeArgumentum pl},{sp},{evadeArgumentum pa}]" := by
  intro aid pl sp pa; rfl

-- メール探索にゃん
theorem theoremaProprietatisExploraPostamAdCatenam : ∀ (acc : String),
  SignumProprietatis.adCatenam (.exploraPostam acc) = s!"\\![biff,{evadeArgumentum acc}]" := by
  intro acc; rfl

-- リソース參照にゃん
theorem theoremaProprietatisReferentiaResourceiAdCatenam : ∀ (rid : String),
  SignumProprietatis.adCatenam (.referentiaResourcei rid) = s!"\\&[{evadeArgumentum rid}]" := by
  intro rid; rfl

-- ウィンドウメッセージにゃん
theorem theoremaProprietatisNuntiumWindowaeAdCatenam : ∀ (u w l : String),
  SignumProprietatis.adCatenam (.nuntiumWindowae u w l) = s!"\\m[{evadeArgumentum u},{evadeArgumentum w},{evadeArgumentum l}]" := by
  intro u w l; rfl

-- 同期オブジェクトゥム待ちにゃん
theorem theoremaProprietatisExpectaSyncObjectumAdCatenam : ∀ (n : String) (t : Nat),
  SignumProprietatis.adCatenam (.expectaSyncObjectum n t) = s!"\\![wait,syncobject,{evadeArgumentum n},{t}]" := by
  intro n t; rfl

-- 更新にゃん
theorem theoremaProprietatisRenovaAliumAdCatenam : ∀ (op : String),
  SignumProprietatis.adCatenam (.renovaAlium op) = s!"\\![updateother,{evadeArgumentum op}]" := by
  intro op; rfl

-- プロパティ設定・取得にゃん
theorem theoremaProprietatisConfiguraProprietatemAdCatenam : ∀ (p : Proprietas) (v : String),
  SignumProprietatis.adCatenam (.configuraProprietatem p v) = s!"\\![set,property,{evadeArgumentum p.toString},{evadeArgumentum v}]" := by
  intro p v; rfl

theorem theoremaProprietatisLegeProprietatemAdCatenam : ∀ (ev : String) (ps : List Proprietas),
  SignumProprietatis.adCatenam (.legeProprietatem ev ps) = s!"\\![get,property,{evadeArgumentum ev},{",".intercalate (ps.map (evadeArgumentum ∘ Proprietas.toString))}]" := by
  intro ev ps; rfl

-- dressup にゃん (Option Bool パラメートゥルムにゃ)
theorem theoremaProprietatisNexaDressupTrueAdCatenam : ∀ (cat pars : String),
  SignumProprietatis.adCatenam (.nexaDressup cat pars (some true)) = s!"\\![bind,{evadeArgumentum cat},{evadeArgumentum pars},1]" := by
  intro cat pars; rfl

theorem theoremaProprietatisNexaDressupFalseAdCatenam : ∀ (cat pars : String),
  SignumProprietatis.adCatenam (.nexaDressup cat pars (some false)) = s!"\\![bind,{evadeArgumentum cat},{evadeArgumentum pars},0]" := by
  intro cat pars; rfl

theorem theoremaProprietatisNexaDressupNoneAdCatenam : ∀ (cat pars : String),
  SignumProprietatis.adCatenam (.nexaDressup cat pars none) = s!"\\![bind,{evadeArgumentum cat},{evadeArgumentum pars},0]" := by
  intro cat pars; rfl

-- ── Inputi (入力ダイアローグスにゃ) ──

-- claudeDialogum にゃん
theorem theoremaInputiClaudeDialogumAdCatenam : ∀ (dialogId : String),
  SignumInputi.adCatenam (.claudeDialogum dialogId) = s!"\\![close,dialog,{evadeArgumentum dialogId}]" := by
  intro dialogId; rfl

-- aperiInputum にゃん (ModusInputiTextus 列挙にゃ)
theorem theoremaInputiAperiInputumAdCatenam : ∀ (m : ModusInputiTextus) (ev tit tx : String) (opt : OptionesInputi),
  SignumInputi.adCatenam (.aperiInputum m ev tit tx opt) =
    (let opt' := opt.toString; let opt' := if opt'.isEmpty then "" else s!",{opt'}"
     s!"\\![open,{m.toString},{evadeArgumentum ev},{evadeArgumentum tit},{evadeArgumentum tx}{opt'}]") := by
  intro m ev tit tx opt; cases m <;> rfl

-- aperiDialogum にゃん (ModusDialogi 列挙にゃ)
theorem theoremaInputiAperiDialogumAdCatenam : ∀ (m : ModusDialogi) (opt : OptionesDialogi),
  SignumInputi.adCatenam (.aperiDialogum m opt) =
    (let opt' := opt.toString; let opt' := if opt'.isEmpty then "" else s!",{opt'}"
     s!"\\![open,dialog,{m.toString}{opt'}]") := by
  intro m opt; cases m <;> rfl

-- ═══════════════════════════════════════════════════════════
-- § 8b. 補遺：§ 8 で漏れたコンストゥルクトルの全稱證明にゃん♪
-- ═══════════════════════════════════════════════════════════

-- ── Fenestrae 補遺にゃ ──

-- restituere (Option String) にゃん
theorem theoremaFenestraeRestituereNoneAdCatenam :
    SignumFenestrae.adCatenam (.restituere none) = "\\![restore]" := by rfl

theorem theoremaFenestraeRestituereSomeAdCatenam : ∀ (n : String),
    SignumFenestrae.adCatenam (.restituere (some n)) = s!"\\![restore,{evadeArgumentum n}]" := by
  intro n; rfl

-- configuraScalamAnimatam にゃん
theorem theoremaFenestraeConfiguraScalamAnimatamAdCatenam : ∀ (x y : Int) (o : String),
    SignumFenestrae.adCatenam (.configuraScalamAnimatam x y o)
      = s!"\\![set,scaling,{x},{y},{evadeArgumentum o}]" := by
  intro x y o; rfl

-- configuraAlphamAnimatam にゃん
theorem theoremaFenestraeConfiguraAlphamAnimatamAdCatenam :
    ∀ (v : Nat) (h : v ≤ 100) (o : String),
    SignumFenestrae.adCatenam (.configuraAlphamAnimatam v h o)
      = s!"\\![set,alpha,{v},{evadeArgumentum o}]" := by
  intro v h o; rfl

-- configuraTapete (Option ModusTapetis) にゃん
theorem theoremaFenestraeConfiguraTapeteNoneAdCatenam : ∀ (v : String),
    SignumFenestrae.adCatenam (.configuraTapete v none)
      = s!"\\![set,wallpaper,{evadeArgumentum v}]" := by
  intro v; rfl

theorem theoremaFenestraeConfiguraTapeteSomeAdCatenam : ∀ (v : String) (m : ModusTapetis),
    SignumFenestrae.adCatenam (.configuraTapete v (some m))
      = s!"\\![set,wallpaper,{evadeArgumentum v},{m.toString}]" := by
  intro v m; cases m <;> rfl

-- ── Modorum 補遺にゃ ──

-- ingredereSticky (Option String) にゃん
theorem theoremaModorumIngredereStickyNoneAdCatenam :
    SignumModorum.adCatenam (.ingredereSticky none) = "\\![enter,sticky]" := by rfl

theorem theoremaModorumIngredereStickyNomenAdCatenam : ∀ (n : String),
    SignumModorum.adCatenam (.ingredereSticky (some n))
      = s!"\\![enter,sticky,{evadeArgumentum n}]" := by
  intro n; rfl

-- ── Mutationis 補遺にゃ ──

-- mutaGhostNomen にゃん
theorem theoremaMutationisMutaGhostNomenAdCatenam : ∀ (nm : String) (opt : OptionesMutationis),
    SignumMutationis.adCatenam (.mutaGhostNomen nm opt)
      = (let o := opt.toString; let o := if o.isEmpty then "" else s!",{o}";
         s!"\\![change,ghost,{evadeArgumentum nm}{o}]") := by
  intro nm opt; rfl

-- mutaShell にゃん
theorem theoremaMutationisMutaShellAdCatenam : ∀ (nm : String) (opt : OptionesMutationis),
    SignumMutationis.adCatenam (.mutaShell nm opt)
      = (let o := opt.toString; let o := if o.isEmpty then "" else s!",{o}";
         s!"\\![change,shell,{evadeArgumentum nm}{o}]") := by
  intro nm opt; rfl

-- mutaBullam にゃん
theorem theoremaMutationisMutaBullamAdCatenam : ∀ (nm : String) (opt : OptionesMutationis),
    SignumMutationis.adCatenam (.mutaBullam nm opt)
      = (let o := opt.toString; let o := if o.isEmpty then "" else s!",{o}";
         s!"\\![change,balloon,{evadeArgumentum nm}{o}]") := by
  intro nm opt; rfl

-- ── Soni 補遺にゃ ──

-- sonusPulsus にゃん
theorem theoremaSoniSonusPulsusAdCatenam : ∀ (via : String) (opt : OptionesSoni),
    SignumSoni.adCatenam (.sonusPulsus via opt)
      = (let s := opt.toString;
         if s.isEmpty then s!"\\![sound,play,{evadeArgumentum via}]"
         else s!"\\![sound,play,{evadeArgumentum via},{s}]") := by
  intro via opt; rfl

-- sonusOneratur にゃん
theorem theoremaSoniSonusOneraturdCatenam : ∀ (via : String) (opt : OptionesSoni),
    SignumSoni.adCatenam (.sonusOneratur via opt)
      = (let s := opt.toString;
         if s.isEmpty then s!"\\![sound,load,{evadeArgumentum via}]"
         else s!"\\![sound,load,{evadeArgumentum via},{s}]") := by
  intro via opt; rfl

-- sonusOptio にゃん
theorem theoremaSoniSonusOptioAdCatenam : ∀ (via : String) (opt : OptionesSoni),
    SignumSoni.adCatenam (.sonusOptio via opt)
      = (let s := opt.toString;
         if s.isEmpty then s!"\\![sound,option,{evadeArgumentum via}]"
         else s!"\\![sound,option,{evadeArgumentum via},{s}]") := by
  intro via opt; rfl

-- ── Retis 補遺にゃ ──

-- HTTP メソッド系にゃん（if 分岐付きにゃ）
theorem theoremaRetisExecutaHttpGetAdCatenam : ∀ (nx opt : String),
    SignumRetis.adCatenam (.executaHttpGet nx opt)
      = (if opt.isEmpty then s!"\\![execute,http-get,{evadeArgumentum nx}]"
         else s!"\\![execute,http-get,{evadeArgumentum nx},{evadeArgumentum opt}]") := by
  intro nx opt; rfl

theorem theoremaRetisExecutaHttpPostAdCatenam : ∀ (nx opt : String),
    SignumRetis.adCatenam (.executaHttpPost nx opt)
      = (if opt.isEmpty then s!"\\![execute,http-post,{evadeArgumentum nx}]"
         else s!"\\![execute,http-post,{evadeArgumentum nx},{evadeArgumentum opt}]") := by
  intro nx opt; rfl

theorem theoremaRetisExecutaHttpHeadAdCatenam : ∀ (nx opt : String),
    SignumRetis.adCatenam (.executaHttpHead nx opt)
      = (if opt.isEmpty then s!"\\![execute,http-head,{evadeArgumentum nx}]"
         else s!"\\![execute,http-head,{evadeArgumentum nx},{evadeArgumentum opt}]") := by
  intro nx opt; rfl

theorem theoremaRetisExecutaHttpPutAdCatenam : ∀ (nx opt : String),
    SignumRetis.adCatenam (.executaHttpPut nx opt)
      = (if opt.isEmpty then s!"\\![execute,http-put,{evadeArgumentum nx}]"
         else s!"\\![execute,http-put,{evadeArgumentum nx},{evadeArgumentum opt}]") := by
  intro nx opt; rfl

theorem theoremaRetisExecutaHttpDeleteAdCatenam : ∀ (nx opt : String),
    SignumRetis.adCatenam (.executaHttpDelete nx opt)
      = (if opt.isEmpty then s!"\\![execute,http-delete,{evadeArgumentum nx}]"
         else s!"\\![execute,http-delete,{evadeArgumentum nx},{evadeArgumentum opt}]") := by
  intro nx opt; rfl

theorem theoremaRetisExecutaHttpPatchAdCatenam : ∀ (nx opt : String),
    SignumRetis.adCatenam (.executaHttpPatch nx opt)
      = (if opt.isEmpty then s!"\\![execute,http-patch,{evadeArgumentum nx}]"
         else s!"\\![execute,http-patch,{evadeArgumentum nx},{evadeArgumentum opt}]") := by
  intro nx opt; rfl

theorem theoremaRetisExecutaHttpOptionsAdCatenam : ∀ (nx opt : String),
    SignumRetis.adCatenam (.executaHttpOptions nx opt)
      = (if opt.isEmpty then s!"\\![execute,http-options,{evadeArgumentum nx}]"
         else s!"\\![execute,http-options,{evadeArgumentum nx},{evadeArgumentum opt}]") := by
  intro nx opt; rfl

theorem theoremaRetisExecutaRssGetAdCatenam : ∀ (nx opt : String),
    SignumRetis.adCatenam (.executaRssGet nx opt)
      = (if opt.isEmpty then s!"\\![execute,rss-get,{evadeArgumentum nx}]"
         else s!"\\![execute,rss-get,{evadeArgumentum nx},{evadeArgumentum opt}]") := by
  intro nx opt; rfl

theorem theoremaRetisExecutaRssPostAdCatenam : ∀ (nx opt : String),
    SignumRetis.adCatenam (.executaRssPost nx opt)
      = (if opt.isEmpty then s!"\\![execute,rss-post,{evadeArgumentum nx}]"
         else s!"\\![execute,rss-post,{evadeArgumentum nx},{evadeArgumentum opt}]") := by
  intro nx opt; rfl

-- extraheArchivum にゃん
theorem theoremaRetisExtraheArchivumAdCatenam : ∀ (v dir opt : String),
    SignumRetis.adCatenam (.extraheArchivum v dir opt)
      = (if opt.isEmpty then s!"\\![execute,extractarchive,{evadeArgumentum v},{evadeArgumentum dir}]"
         else s!"\\![execute,extractarchive,{evadeArgumentum v},{evadeArgumentum dir},{evadeArgumentum opt}]") := by
  intro v dir opt; rfl

-- comprimeArchivum にゃん
theorem theoremaRetisComprimeArchivumAdCatenam : ∀ (v dir opt : String),
    SignumRetis.adCatenam (.comprimeArchivum v dir opt)
      = (if opt.isEmpty then s!"\\![execute,compressarchive,{evadeArgumentum v},{evadeArgumentum dir}]"
         else s!"\\![execute,compressarchive,{evadeArgumentum v},{evadeArgumentum dir},{evadeArgumentum opt}]") := by
  intro v dir opt; rfl

-- ── Animationis 補遺にゃ ──

-- animaAddTextum にゃん
theorem theoremaAnimationisAnimaAddTextumAdCatenam :
    ∀ (x y w h : Int) (txt : String) (t : Nat) (r g b mag : Nat) (fons : String),
    SignumAnimationis.adCatenam (.animaAddTextum x y w h txt t r g b mag fons)
      = (let fontPars := if fons.isEmpty then "" else s!",{evadeArgumentum fons}";
         s!"\\![anim,add,text,{x},{y},{w},{h},{evadeArgumentum txt},{t},{r},{g},{b},{mag}{fontPars}]") := by
  intro x y w h txt t r g b mag fons; rfl

-- animaAddOverlayAnimatum にゃん
theorem theoremaAnimationisAnimaAddOverlayAnimatumAdCatenam :
    ∀ (aid : Nat) (x y : Int) (t : Nat) (opt : String),
    SignumAnimationis.adCatenam (.animaAddOverlayAnimatum aid x y t opt)
      = (let optPars := if opt.isEmpty then "" else s!",{evadeArgumentum opt}";
         s!"\\![anim,add,overlay,{aid},{x},{y},{t}{optPars}]") := by
  intro aid x y t opt; rfl

-- ── Eventuum 補遺にゃ ──

-- 全稱版（任意のリストゥスに對する定義通りの等式にゃ）
theorem theoremaEventuumExcitaAdCatenam : ∀ (ev : String) (cc : List String),
    SignumEventuum.adCatenam (.excita ev cc)
      = (let ccat := match cc with
           | [] => "" | res => "," ++ ",".intercalate (res.map evadeArgumentum);
         s!"\\![raise,{evadeArgumentum ev}{ccat}]") := by
  intro ev cc; rfl

theorem theoremaEventuumInsereAdCatenam : ∀ (ev : String) (cc : List String),
    SignumEventuum.adCatenam (.insere ev cc)
      = (let ccat := match cc with
           | [] => "" | res => "," ++ ",".intercalate (res.map evadeArgumentum);
         s!"\\![embed,{evadeArgumentum ev}{ccat}]") := by
  intro ev cc; rfl

theorem theoremaEventuumNotificaAdCatenam : ∀ (ev : String) (cc : List String),
    SignumEventuum.adCatenam (.notifica ev cc)
      = (let ccat := match cc with
           | [] => "" | res => "," ++ ",".intercalate (res.map evadeArgumentum);
         s!"\\![notify,{evadeArgumentum ev}{ccat}]") := by
  intro ev cc; rfl

theorem theoremaEventuumExcitaPostTempusAdCatenam : ∀ (t r : Nat) (ev : String) (cc : List String),
    SignumEventuum.adCatenam (.excitaPostTempus t r ev cc)
      = (let ccat := match cc with
           | [] => "" | res => "," ++ ",".intercalate (res.map evadeArgumentum);
         s!"\\![timerraise,{t},{r},{evadeArgumentum ev}{ccat}]") := by
  intro t r ev cc; rfl

theorem theoremaEventuumExcitaAliumAdCatenam : ∀ (gn ev : String) (cc : List String),
    SignumEventuum.adCatenam (.excitaAlium gn ev cc)
      = (let ccat := match cc with
           | [] => "" | res => "," ++ ",".intercalate (res.map evadeArgumentum);
         s!"\\![raiseother,{evadeArgumentum gn},{evadeArgumentum ev}{ccat}]") := by
  intro gn ev cc; rfl

theorem theoremaEventuumExcitaAliumPostTempusAdCatenam :
    ∀ (t r : Nat) (gn ev : String) (cc : List String),
    SignumEventuum.adCatenam (.excitaAliumPostTempus t r gn ev cc)
      = (let ccat := match cc with
           | [] => "" | res => "," ++ ",".intercalate (res.map evadeArgumentum);
         s!"\\![timerraiseother,{t},{r},{evadeArgumentum gn},{evadeArgumentum ev}{ccat}]") := by
  intro t r gn ev cc; rfl

theorem theoremaEventuumNotificaPostTempusAdCatenam : ∀ (t r : Nat) (ev : String) (cc : List String),
    SignumEventuum.adCatenam (.notificaPostTempus t r ev cc)
      = (let ccat := match cc with
           | [] => "" | res => "," ++ ",".intercalate (res.map evadeArgumentum);
         s!"\\![timernotify,{t},{r},{evadeArgumentum ev}{ccat}]") := by
  intro t r ev cc; rfl

theorem theoremaEventuumNotificaAliumAdCatenam : ∀ (gn ev : String) (cc : List String),
    SignumEventuum.adCatenam (.notificaAlium gn ev cc)
      = (let ccat := match cc with
           | [] => "" | res => "," ++ ",".intercalate (res.map evadeArgumentum);
         s!"\\![notifyother,{evadeArgumentum gn},{evadeArgumentum ev}{ccat}]") := by
  intro gn ev cc; rfl

theorem theoremaEventuumNotificaAliumPostTempusAdCatenam :
    ∀ (t r : Nat) (gn ev : String) (cc : List String),
    SignumEventuum.adCatenam (.notificaAliumPostTempus t r gn ev cc)
      = (let ccat := match cc with
           | [] => "" | res => "," ++ ",".intercalate (res.map evadeArgumentum);
         s!"\\![timernotifyother,{t},{r},{evadeArgumentum gn},{evadeArgumentum ev}{ccat}]") := by
  intro t r gn ev cc; rfl

theorem theoremaEventuumNotificaPluginAdCatenam : ∀ (pn ev : String) (cc : List String),
    SignumEventuum.adCatenam (.notificaPlugin pn ev cc)
      = (let ccat := match cc with
           | [] => "" | res => "," ++ ",".intercalate (res.map evadeArgumentum);
         s!"\\![notifyplugin,{evadeArgumentum pn},{evadeArgumentum ev}{ccat}]") := by
  intro pn ev cc; rfl

theorem theoremaEventuumExcitaPluginPostTempusAdCatenam :
    ∀ (t r : Nat) (pn ev : String) (cc : List String),
    SignumEventuum.adCatenam (.excitaPluginPostTempus t r pn ev cc)
      = (let ccat := match cc with
           | [] => "" | res => "," ++ ",".intercalate (res.map evadeArgumentum);
         s!"\\![timerraiseplugin,{t},{r},{evadeArgumentum pn},{evadeArgumentum ev}{ccat}]") := by
  intro t r pn ev cc; rfl

theorem theoremaEventuumNotificaPluginPostTempusAdCatenam :
    ∀ (t r : Nat) (pn ev : String) (cc : List String),
    SignumEventuum.adCatenam (.notificaPluginPostTempus t r pn ev cc)
      = (let ccat := match cc with
           | [] => "" | res => "," ++ ",".intercalate (res.map evadeArgumentum);
         s!"\\![timernotifyplugin,{t},{r},{evadeArgumentum pn},{evadeArgumentum ev}{ccat}]") := by
  intro t r pn ev cc; rfl

theorem theoremaEventuumVocaShioriAdCatenam : ∀ (ev : String) (cc : List String),
    SignumEventuum.adCatenam (.vocaShiori ev cc)
      = (let ccat := match cc with
           | [] => "" | res => "," ++ ",".intercalate (res.map evadeArgumentum);
         s!"\\![call,shiori,{evadeArgumentum ev}{ccat}]") := by
  intro ev cc; rfl

theorem theoremaEventuumVocaSaoriAdCatenam : ∀ (dp fn : String) (cc : List String),
    SignumEventuum.adCatenam (.vocaSaori dp fn cc)
      = (let ccat := match cc with
           | [] => "" | res => "," ++ ",".intercalate (res.map evadeArgumentum);
         s!"\\![call,saori,{evadeArgumentum dp},{evadeArgumentum fn}{ccat}]") := by
  intro dp fn cc; rfl

theorem theoremaEventuumVocaPluginAdCatenam : ∀ (pn ev : String) (cc : List String),
    SignumEventuum.adCatenam (.vocaPlugin pn ev cc)
      = (let ccat := match cc with
           | [] => "" | res => "," ++ ",".intercalate (res.map evadeArgumentum);
         s!"\\![raiseplugin,{evadeArgumentum pn},{evadeArgumentum ev}{ccat}]") := by
  intro pn ev cc; rfl

theorem theoremaEventuumVocaGhostAdCatenam : ∀ (nm : String) (opt : OptionesMutationis),
    SignumEventuum.adCatenam (.vocaGhost nm opt)
      = (let o := opt.toString; let o := if o.isEmpty then "" else s!",{o}";
         s!"\\![call,ghost,{evadeArgumentum nm}{o}]") := by
  intro nm opt; rfl

-- ── Proprietatis 補遺にゃ ──

-- proprietasCitata にゃん
theorem theoremaProprietatisProprietasCitataAdCatenam : ∀ (p : Proprietas),
    SignumProprietatis.adCatenam (.proprietasCitata p)
      = s!"%property[{escapePropNomen p.toString}]" := by
  intro p; rfl

-- applicaFiltratum にゃん
theorem theoremaProprietatisApplicaFiltratumAdCatenam : ∀ (pl : String) (t : Nat) (pa : String),
    SignumProprietatis.adCatenam (.applicaFiltratum pl t pa)
      = (if pl.isEmpty then "\\![filter]"
         else s!"\\![filter,{evadeArgumentum pl},{t},{evadeArgumentum pa}]") := by
  intro pl t pa; rfl

-- renovaScopum にゃん
theorem theoremaProprietatisRenovaScopumAdCatenam : ∀ (sc op : String),
    SignumProprietatis.adCatenam (.renovaScopum sc op)
      = (if op.isEmpty then s!"\\![update,{evadeArgumentum sc}]"
         else s!"\\![update,{evadeArgumentum sc},{evadeArgumentum op}]") := by
  intro sc op; rfl

-- renovaSeIpsum にゃん
theorem theoremaProprietatisRenovaSeIpsumAdCatenam : ∀ (op : String),
    SignumProprietatis.adCatenam (.renovaSeIpsum op)
      = (if op.isEmpty then "\\![updatebymyself]"
         else s!"\\![updatebymyself,{evadeArgumentum op}]") := by
  intro op; rfl

-- evanesceSeIpsum にゃん
theorem theoremaProprietatisEvanesceSeIpsumAdCatenam : ∀ (op : String),
    SignumProprietatis.adCatenam (.evanesceSeIpsum op)
      = (if op.isEmpty then "\\![vanishbymyself]"
         else s!"\\![vanishbymyself,{evadeArgumentum op}]") := by
  intro op; rfl

-- ── Inputi 補遺にゃ ──

-- aperiInputumDiei にゃん
theorem theoremaInputiAperiInputumDieiAdCatenam :
    ∀ (ev tit : String) (a m d : Nat) (hm : 1 ≤ m ∧ m ≤ 12)
      (hd : 1 ≤ d ∧ d ≤ diesInMense a m) (opt : OptionesInputi),
    SignumInputi.adCatenam (.aperiInputumDiei ev tit a m d hm hd opt)
      = (let o := opt.toString; let o := if o.isEmpty then "" else s!",{o}";
         s!"\\![open,dateinput,{evadeArgumentum ev},{evadeArgumentum tit},{a},{m},{d}{o}]") := by
  intro ev tit a m d hm hd opt; rfl

-- aperiInputumTemporis にゃん
theorem theoremaInputiAperiInputumTemporisAdCatenam :
    ∀ (ev tit : String) (h : Nat) (hh : h ≤ 23) (mi : Nat) (hmi : mi ≤ 59)
      (s : Nat) (hs : s ≤ 59) (opt : OptionesInputi),
    SignumInputi.adCatenam (.aperiInputumTemporis ev tit h hh mi hmi s hs opt)
      = (let o := opt.toString; let o := if o.isEmpty then "" else s!",{o}";
         s!"\\![open,timeinput,{evadeArgumentum ev},{evadeArgumentum tit},{h},{mi},{s}{o}]") := by
  intro ev tit h hh mi hmi s hs opt; rfl

-- aperiInputumGradus にゃん
theorem theoremaInputiAperiInputumGradusAdCatenam :
    ∀ (ev tit : String) (mn mx ini : Nat) (h : mn ≤ ini ∧ ini ≤ mx) (opt : OptionesInputi),
    SignumInputi.adCatenam (.aperiInputumGradus ev tit mn mx ini h opt)
      = (let o := opt.toString; let o := if o.isEmpty then "" else s!",{o}";
         s!"\\![open,sliderinput,{evadeArgumentum ev},{evadeArgumentum tit},{mn},{mx},{ini}{o}]") := by
  intro ev tit mn mx ini h opt; rfl

-- aperiInputumIP にゃん
theorem theoremaInputiAperiInputumIPAdCatenam :
    ∀ (ev tit : String) (ip1 : Nat) (h1 : ip1 ≤ 255)
      (ip2 : Nat) (h2 : ip2 ≤ 255) (ip3 : Nat) (h3 : ip3 ≤ 255)
      (ip4 : Nat) (h4 : ip4 ≤ 255) (opt : OptionesInputi),
    SignumInputi.adCatenam (.aperiInputumIP ev tit ip1 h1 ip2 h2 ip3 h3 ip4 h4 opt)
      = (let o := opt.toString; let o := if o.isEmpty then "" else s!",{o}";
         s!"\\![open,ipinput,{evadeArgumentum ev},{evadeArgumentum tit},{ip1},{ip2},{ip3},{ip4}{o}]") := by
  intro ev tit ip1 h1 ip2 h2 ip3 h3 ip4 h4 opt; rfl

-- aperiInputumColoris にゃん
theorem theoremaInputiAperiInputumColorisAdCatenam :
    ∀ (ev tit : String) (r : Nat) (hr : r ≤ 255)
      (g : Nat) (hg : g ≤ 255) (b : Nat) (hb : b ≤ 255) (opt : OptionesInputi),
    SignumInputi.adCatenam (.aperiInputumColoris ev tit r hr g hg b hb opt)
      = (let o := opt.toString; let o := if o.isEmpty then "" else s!",{o}";
         s!"\\![open,colorinput,{evadeArgumentum ev},{evadeArgumentum tit},{r},{g},{b}{o}]") := by
  intro ev tit r hr g hg b hb opt; rfl

end Signaculum.Sakura
