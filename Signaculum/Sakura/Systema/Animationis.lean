-- Signaculum.Sakura.Systema.Animationis
-- 動畫パターン制御關數にゃん♪

import Signaculum.Sakura.Fundamentum

namespace Signaculum.Sakura.Systema

-- ════════════════════════════════════════════════════
--  表面拡張 (Extensio Superficiei)
-- ════════════════════════════════════════════════════

/-- 表面を非表示にするにゃん（\\s[-1]）-/
def superficiesAbsconde {m : Type → Type} [Monad m] : SakuraM m Unit :=
  emitte (.superficiei .superficiesAbsconde)

/-- 表面動畫を再生して完了まで待つにゃん（\\i[id,wait]）-/
def animatioExpecta {m : Type → Type} [Monad m] (animId : Nat) : SakuraM m Unit :=
  emitte (.superficiei (.animatioExpecta animId))

/-- 指定スコープのアニメーションパターンを再開するにゃん（\\![anim,resume,scopus,id]）-/
def animaContinuat {m : Type → Type} [Monad m] (scopus animId : Nat) : SakuraM m Unit :=
  emitte (.animationis (.animaContinuat scopus animId))

/-- 指定スコープのアニメーションパターンを消去するにゃん（\\![anim,clear,scopus,id]）-/
def animaPurgat {m : Type → Type} [Monad m] (scopus animId : Nat) : SakuraM m Unit :=
  emitte (.animationis (.animaPurgat scopus animId))

/-- 指定スコープのアニメーション位置をオフセットするにゃん（\\![anim,offset,scopus,id,x,y]）-/
def animaTranslatio {m : Type → Type} [Monad m] (scopus animId : Nat) (x y : Int) : SakuraM m Unit :=
  emitte (.animationis (.animaTranslatio scopus animId x y))

-- ════════════════════════════════════════════════════
--  動畫パターン制御 (Imperium Animationis Exemplarium)
-- ════════════════════════════════════════════════════

/-- 指定スコープのアニメーションパターンを開始するにゃん（\\![anim,start,scopus,id]）-/
def animaIncepit {m : Type → Type} [Monad m] (scopus id : Nat) : SakuraM m Unit :=
  emitte (.animationis (.animaIncepit scopus id))

/-- 指定スコープのアニメーションパターンを停止するにゃん（\\![anim,stop,scopus,id]）-/
def animaDesinit {m : Type → Type} [Monad m] (scopus id : Nat) : SakuraM m Unit :=
  emitte (.animationis (.animaDesinit scopus id))

/-- 指定スコープのアニメーションパターンを一時停止するにゃん（\\![anim,pause,scopus,id]）-/
def animaPausat {m : Type → Type} [Monad m] (scopus id : Nat) : SakuraM m Unit :=
  emitte (.animationis (.animaPausat scopus id))

/-- 指定スコープのアニメーションが再生中か確認するにゃん（\\![anim,playing,scopus,id]）。
    SSP 固有にゃん -/
def animaOperatur {m : Type → Type} [Monad m] (scopus id : Nat) : SakuraM m Unit :=
  emitte (.animationis (.animaOperatur scopus id))

-- ════════════════════════════════════════════════════
--  動畫追加 (Additio Animationis) — anim add 系
-- ════════════════════════════════════════════════════

/-- アニメーションにオーバーレイを追加するにゃん（\\![anim,add,overlay,id]）-/
def animaAddOverlay {m : Type → Type} [Monad m] (animId : Nat) : SakuraM m Unit :=
  emitte (.animationis (.animaAddOverlay animId))

/-- アニメーションにオーバーレイを座標指定で追加するにゃん（\\![anim,add,overlay,id,x,y]）-/
def animaAddOverlayPos {m : Type → Type} [Monad m] (animId : Nat) (x y : Int) : SakuraM m Unit :=
  emitte (.animationis (.animaAddOverlayPos animId x y))

/-- アニメーションのベース表面を変更するにゃん（\\![anim,add,base,id]）-/
def animaAddBase {m : Type → Type} [Monad m] (animId : Nat) : SakuraM m Unit :=
  emitte (.animationis (.animaAddBase animId))

/-- アニメーションを移動するにゃん（\\![anim,add,move,x,y]）-/
def animaAddMove {m : Type → Type} [Monad m] (x y : Int) : SakuraM m Unit :=
  emitte (.animationis (.animaAddMove x y))

/-- 高速オーバーレイを追加するにゃん（\\![anim,add,overlayfast,id]）-/
def animaAddOverlayFast {m : Type → Type} [Monad m] (animId : Nat) : SakuraM m Unit :=
  emitte (.animationis (.animaAddOverlayFast animId))

-- ════════════════════════════════════════════════════
--  動畫拡張2 (Extensio Animationis II)
-- ════════════════════════════════════════════════════

/-- サーフェス上にテクストゥスを表示するにゃん（\\![anim,add,text,x,y,w,h,text,time,r,g,b,size,font]）-/
def animaAddTextum {m : Type → Type} [Monad m]
    (x y latitudo altitudo : Int) (textus : String) (tempus : Nat)
    (r g b : Nat) (_hr : r ≤ 255 := by omega) (_hg : g ≤ 255 := by omega) (_hb : b ≤ 255 := by omega)
    (magnitudo : Nat) (fons : String := "") : SakuraM m Unit :=
  emitte (.animationis (.animaAddTextum x y latitudo altitudo textus tempus r g b magnitudo fons))

/-- タイミング付きオーバーレイ動畫にゃん（\\![anim,add,overlay,ID,x,y,time,options]）-/
def animaAddOverlayAnimatum {m : Type → Type} [Monad m]
    (animId : Nat) (x y : Int) (tempus : Nat) (optiones : String := "") : SakuraM m Unit :=
  emitte (.animationis (.animaAddOverlayAnimatum animId x y tempus optiones))

end Signaculum.Sakura.Systema
