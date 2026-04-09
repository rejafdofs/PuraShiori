-- Signaculum.Auxilium.SermoFortuitus
-- ランダムトーク選択システムにゃん♪ あやりりす風の季節・時間帯別ランダムトーク＋重複回避を提供するにゃ

import Signaculum.Auxilium.Tempestas
import Signaculum.Sakura.Status

set_option autoImplicit false

namespace Signaculum.Auxilium.SermoFortuitus
open Signaculum.Auxilium.Tempestas
open Signaculum.Sakura

-- ═══════════════════════════════════════════════════
--  トーク候補 (Candidatus)
-- ═══════════════════════════════════════════════════

/-- ランダムトーク候補にゃん♪ -/
structure Candidatus where
  /-- トーク内容（SakuraIO アクション）にゃ -/
  actio      : SakuraIO Unit
  /-- 季節制限にゃん。`none` なら通年にゃ -/
  tempestas? : Option Tempestas := none
  /-- 時間帯制限にゃん。`none` なら終日にゃ -/
  horae?     : Option Horae     := none
  /-- 重みにゃん（大きいほど選ばれやすい）。既定 1 にゃ -/
  pondus     : Nat              := 1

-- ═══════════════════════════════════════════════════
--  登録簿 (Registrum)
-- ═══════════════════════════════════════════════════

/-- ランダムトークの登録簿にゃん♪
    候補一覽と既出履歴を持つにゃ -/
structure Registrum where
  /-- 全候補にゃ -/
  candidati : Array Candidatus
  /-- 既出インデックスの履歴にゃん。一巡したらリセットするにゃ -/
  historia  : IO.Ref (Array Nat)

/-- 登録簿を作成するにゃん♪ -/
def creare (candidati : Array Candidatus) : IO Registrum := do
  let historia ← IO.mkRef #[]
  return { candidati, historia }

-- ═══════════════════════════════════════════════════
--  選択 (Electio)
-- ═══════════════════════════════════════════════════

/-- 現在の條件に合致する候補をフィルタするにゃん -/
private def filtra (candidati : Array Candidatus) (tempestas : Tempestas) (horae : Horae)
    : Array (Nat × Candidatus) := Id.run do
  let mut result : Array (Nat × Candidatus) := #[]
  for h : i in [:candidati.size] do
    let c := candidati[i]'h.upper
    let tempestasOk := match c.tempestas? with
      | none   => true
      | some t => t == tempestas
    let horaeOk := match c.horae? with
      | none   => true
      | some h => h == horae
    if tempestasOk && horaeOk then result := result.push (i, c)
  return result

/-- 重み附きランダム選択にゃん♪
    既出を除外して選ぶにゃ。全部既出なら履歴をリセットするにゃん -/
private def eligeInternum (filtrati : Array (Nat × Candidatus))
    (historiaRef : IO.Ref (Array Nat)) : IO (Option (Nat × Candidatus)) := do
  if filtrati.isEmpty then return none
  let historia ← historiaRef.get
  -- 未出の候補にゃん
  let nonVisi := filtrati.filter fun (i, _) => !historia.contains i
  -- 全部既出なら履歴リセットにゃん
  let effectivi ← if nonVisi.isEmpty then do
    historiaRef.set #[]
    pure filtrati
  else
    pure nonVisi
  if effectivi.isEmpty then return none
  -- 重みの合計にゃん
  let pondusTotal := effectivi.foldl (init := 0) fun acc (_, c) => acc + c.pondus
  if pondusTotal == 0 then return none
  -- ランダム選択にゃん
  let r ← IO.rand 0 (pondusTotal - 1)
  let mut cumul := 0
  for (i, c) in effectivi do
    cumul := cumul + c.pondus
    if r < cumul then
      historiaRef.modify (·.push i)
      return some (i, c)
  -- フォールバック（到達しにゃいはずにゃが念のため）
  if h : effectivi.size > 0 then
    let last := effectivi[effectivi.size - 1]
    historiaRef.modify (·.push last.1)
    return some last
  else
    return none

/-- 現在の季節・時間帯に合ったトークをランダムに選んで實行するにゃん♪
    該當するトークが無い場合は何もしにゃいにゃ。

    - `reg`: 登録簿
    - `mensis`: 現在の月（1〜12）
    - `hora`: 現在の時（0〜23）-/
def elige (reg : Registrum) (mensis hora : Nat) : SakuraIO Unit := do
  let tempestas := Tempestas.exMense mensis
  let horae := Horae.exHora hora
  let filtrati := filtra reg.candidati tempestas horae
  let electum ← liftM (show IO _ from eligeInternum filtrati reg.historia)
  match electum with
  | some (_, c) => c.actio
  | none => pure ()

/-- 季節・時間帯を無視して全候補からランダムに選んで實行するにゃん -/
def eligeOmnes (reg : Registrum) : SakuraIO Unit := do
  let mut omnesArr : Array (Nat × Candidatus) := #[]
  for h : i in [:reg.candidati.size] do
    omnesArr := omnesArr.push (i, reg.candidati[i]'h.upper)
  let omnes := omnesArr
  let electum ← liftM (show IO _ from eligeInternum omnes reg.historia)
  match electum with
  | some (_, c) => c.actio
  | none => pure ()

/-- 履歴をリセットするにゃん♪ 日付が變はった時等に呼ぶにゃ -/
def resettaHistoriam (reg : Registrum) : IO Unit :=
  reg.historia.set #[]

end Signaculum.Auxilium.SermoFortuitus
