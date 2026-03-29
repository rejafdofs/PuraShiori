-- Signaculum.Sakura.Textus.Exhibitionis
-- 文字表示關數にゃん♪

import Signaculum.Sakura.Fundamentum

namespace Signaculum.Sakura.Textus

-- ════════════════════════════════════════════════════
--  文字表示 (Exhibitio Textus)
-- ════════════════════════════════════════════════════

/-- 改行（\\n）にゃん -/
def linea {m : Type → Type} [Monad m] : SakuraM m Unit := emitte (.exhibitionis .linea)

/-- 半改行（\\n[half]）にゃん -/
def dimidiaLinea {m : Type → Type} [Monad m] : SakuraM m Unit :=
  emitte (.exhibitionis .dimidiaLinea)

/-- 吹出しの文字を淸掃する（\\c）にゃん -/
def purga {m : Type → Type} [Monad m] : SakuraM m Unit := emitte (.exhibitionis .purga)

/-- 前の吹出しに追記する（\\C）にゃん -/
def adscribe {m : Type → Type} [Monad m] : SakuraM m Unit := emitte (.exhibitionis .adscribe)

/-- カーソル位置を指定する（\\_l[x,y]）にゃん -/
def cursor {m : Type → Type} [Monad m] (x y : String) : SakuraM m Unit :=
  emitte (.exhibitionis (.cursor x y))

/-- URL やファスキクルスへジャンプする（\\j[url]）にゃん -/
def saltum {m : Type → Type} [Monad m] (nexus : String) : SakuraM m Unit :=
  emitte (.exhibitionis (.saltum nexus))

/-- 特殊文字の遁走(escape)にゃん -/
def evade {m : Type → Type} [Monad m] (c : Char) : SakuraM m Unit :=
  emitte (.exhibitionis (.textus (String.ofList [c])))

/-- Unicode コードポイントで文字を出力するにゃん（\\_u[0xXXXX]）。
    code は "0041" のやうに 4 桁 16 進數で指定にゃ -/
def characterUnicode {m : Type → Type} [Monad m] (code : String) : SakuraM m Unit :=
  emitte (.exhibitionis (.characterUnicode code))

/-- メッセージコードで文字を出力するにゃん（\\_m[0xXX]）-/
def characterMessage {m : Type → Type} [Monad m] (code : String) : SakuraM m Unit :=
  emitte (.exhibitionis (.characterMessage code))

-- ════════════════════════════════════════════════════
--  文字・行淸掃拡張 (Extensio Purgationis)
-- ════════════════════════════════════════════════════

/-- カーソル位置から n 文字を淸掃するにゃん（\\c[char,n]）-/
def purgaCharacterem {m : Type → Type} [Monad m] (n : Nat) : SakuraM m Unit :=
  emitte (.exhibitionis (.purgaCharacterem n))

/-- 指定位置から n 文字を淸掃するにゃん（\\c[char,n,initium]）-/
def purgaCharacteremAb {m : Type → Type} [Monad m] (n initium : Nat) : SakuraM m Unit :=
  emitte (.exhibitionis (.purgaCharacteremAb n initium))

/-- カーソル位置から n 行を淸掃するにゃん（\\c[line,n]）-/
def purgaLineam {m : Type → Type} [Monad m] (n : Nat) : SakuraM m Unit :=
  emitte (.exhibitionis (.purgaLineam n))

/-- 指定位置から n 行を淸掃するにゃん（\\c[line,n,initium]）-/
def purgaLineamAb {m : Type → Type} [Monad m] (n initium : Nat) : SakuraM m Unit :=
  emitte (.exhibitionis (.purgaLineamAb n initium))

end Signaculum.Sakura.Textus
