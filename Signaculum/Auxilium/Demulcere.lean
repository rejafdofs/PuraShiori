-- Signaculum.Auxilium.Demulcere
-- なでなで（マウス撫で）検出にゃん♪ あやりりす風のマウスなで判定を提供するにゃ

set_option autoImplicit false

namespace Signaculum.Auxilium.Demulcere

/-- なでなで檢出の狀態にゃん♪ -/
structure StatusDemulcendi where
  /-- 連續なで回數にゃ -/
  numerus       : Nat    := 0
  /-- 現在の當たり判定領域にゃ -/
  regio         : String := ""
  /-- 對象キャラ番號にゃ -/
  scopus        : Nat    := 0
  /-- 最後のマウス移動時刻（ミリ秒）にゃ -/
  ultimumTempus : Nat    := 0
  deriving Repr, Inhabited

/-- なで感度の既定値にゃん。この回數以上連續で同じ領域をなでると成立するにゃ -/
def sensibilitasDefalta : Nat := 4

/-- なでタイムアウト（ミリ秒）にゃん。この時間以上間隔が空くとリセットにゃ -/
def tempusLimitis : Nat := 1500

/-- マウス移動時に呼ぶにゃん♪
    同じキャラ・同じ領域への連續移動を數へて、
    閾値に達したら `true`（なでなで成立）を返すにゃ。
    達した瞬間だけ true を返し、カウントはリセットするにゃん。

    - `ref`: なでなで狀態の IO.Ref
    - `scopus`: 對象キャラ番號（Reference3）
    - `regio`: 當たり判定名（Reference4）
    - `tempusMs`: 現在のミリ秒時刻（OnSecondChange 等から取得、0 なら時刻チェック無し）
    - `sensibilitas`: 成立閾値（既定 4） -/
def tracta (ref : IO.Ref StatusDemulcendi)
    (scopus : Nat) (regio : String)
    (tempusMs : Nat := 0) (sensibilitas : Nat := sensibilitasDefalta)
    : IO Bool := do
  let st ← ref.get
  -- 領域かキャラが變はった → リセットにゃ
  if regio != st.regio || scopus != st.scopus then
    ref.set { numerus := 1, regio, scopus, ultimumTempus := tempusMs }
    return false
  -- タイムアウトチェックにゃ（tempusMs > 0 の時のみ）
  if tempusMs > 0 && st.ultimumTempus > 0 && tempusMs - st.ultimumTempus > tempusLimitis then
    ref.set { numerus := 1, regio, scopus, ultimumTempus := tempusMs }
    return false
  -- 空領域は無視にゃん
  if regio.isEmpty then
    return false
  -- カウント增加にゃん
  let novusNumerus := st.numerus + 1
  if novusNumerus ≥ sensibilitas then
    -- 成立にゃ！カウントをリセットするにゃん
    ref.set { numerus := 0, regio, scopus, ultimumTempus := tempusMs }
    return true
  else
    ref.set { numerus := novusNumerus, regio, scopus, ultimumTempus := tempusMs }
    return false

/-- なでなで狀態を完全にリセットするにゃん -/
def resetta (ref : IO.Ref StatusDemulcendi) : IO Unit :=
  ref.set {}

end Signaculum.Auxilium.Demulcere
