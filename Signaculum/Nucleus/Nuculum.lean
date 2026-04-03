-- Signaculum.Nucleus.Nuculum
-- 栞の核心骨格にゃん。處理器の登錄と事象のルーティングを擔ふにゃ

import Signaculum.Protocollum.Typi
import Signaculum.Sakura.Scriptum
import Signaculum.Protocollum.Rogatio
import Signaculum.Protocollum.Responsum
import Std.Data.HashMap

namespace Signaculum.Nucleus
open Signaculum.Protocollum
open Signaculum.Sakura

/-- 事象處理器の型にゃん。
    お嬢樣はこの型の關數を書くだけでよいにゃ。
    Rogatio を受け取って SakuraScript を do 記法で組み立てるにゃん -/
def Tractator := Rogatio → SakuraIO Unit

/-- 動的コールバックレジストリにゃん♪
    ランタイムで登錄されるコールバック（ローカル變數等）を保持するにゃ。
    靜的ハンドラテーブルに無いイヴェント名はこちらをフォールバック檢索するにゃん -/
initialize dynamicTractatores : IO.Ref (Std.HashMap String Tractator) ← IO.mkRef {}

/-- Nat を指定桁數の0埋め16進文字列にするにゃん -/
private def hexPad (n : Nat) (width : Nat) : String :=
  let digits := Nat.toDigits 16 n
  let pad := List.replicate (width - digits.length) '0'
  String.ofList (pad ++ digits)

/-- ランタイムで UUID v4 準據のイヴェント名を生成するにゃん♪
    形式: `On_xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx` -/
def generaNomenEventumIO : IO String := do
  let a ← IO.rand 0 (2^32 - 1)
  let b ← IO.rand 0 (2^16 - 1)
  let c ← IO.rand 0 (2^12 - 1)
  let d ← IO.rand 0 (2^14 - 1)
  let e ← IO.rand 0 (2^48 - 1)
  let c4 := 0x4000 + c
  let d8 := 0x8000 + (d % 0x4000)
  return s!"On_{hexPad a 8}-{hexPad b 4}-{hexPad c4 4}-{hexPad d8 4}-{hexPad e 12}"

/-- ランタイムコールバックを動的レジストリに登錄して UUID を返すにゃん♪
    SakuraIO コンテクスト内で使へるにゃ -/
def registraCallbackumDynamicum (handler : Tractator) : SakuraIO String := do
  let uuid ← liftM (show IO String from generaNomenEventumIO)
  liftM (show IO Unit from dynamicTractatores.modify (·.insert uuid handler))
  return uuid

/-- 栞の狀態にゃん -/
structure StatusShiori where
  /-- 家ディレクトーリウム（ゴーストのフォルダーにゃ）-/
  domus : String := ""
  deriving Repr, Inhabited

/-- 栞の本體にゃん。處理器の一覽と可變狀態を持つにゃ -/
structure Shiori where
  /-- 事象名と處理器の對應表にゃん（HashMap で O(1) 探索にゃ）-/
  tractatores : Std.HashMap String Tractator
  /-- 栞の可變狀態にゃ -/
  status : IO.Ref StatusShiori
  /-- 讀込(load)時に呼ばれるフックにゃん。domus（家ディレクトーリウム）を受け取るにゃ -/
  onOnerare : Option (String → IO Unit) := none
  /-- 書出(unload)時に呼ばれるフックにゃん -/
  onExire   : Option (IO Unit)          := none

namespace Shiori

/-- 處理器一覽から栞を構築するにゃん -/
def creare (tractatores : List (String × Tractator))
    (onOnerare : Option (String → IO Unit) := none)
    (onExire   : Option (IO Unit)          := none) : IO Shiori := do
  let status ← IO.mkRef ({} : StatusShiori)
  let mappa := Std.HashMap.ofList tractatores
  return { tractatores := mappa, status, onOnerare, onExire }

/-- 家ディレクトーリウムを設定するにゃん -/
def statuereDomus (s : Shiori) (domus : String) : IO Unit := do
  s.status.modify (fun st => { st with domus })

/-- 家ディレクトーリウムを取得するにゃん -/
def obtinereDomus (s : Shiori) : IO String := do
  let st ← s.status.get
  return st.domus

/-- 要求を處理して應答を返すにゃん。
    これが栞の心臟部にゃ -/
def tracta (s : Shiori) (rogatio : Rogatio) : IO Responsum := do
  -- 靜的→動的の順で處理器を探すにゃん
  let tractator? ← match s.tractatores[rogatio.nomen]? with
    | some t => pure (some t)
    | none => do
      let dyn ← dynamicTractatores.get
      pure dyn[rogatio.nomen]?
  match tractator? with
  | some tractator =>
    try
      -- SakuraScript モナドを實行して StatusSakurae を得るにゃん
      let status ← Sakura.Textus.currere (tractator rogatio)
      match rogatio.methodus with
      | .pete     => return {
          status           := .ok
          valor            := some (Signaculum.Sakura.adCatenamLista status.scriptum)
          marker           := status.marker
          balloonOffset    := status.balloonOffset
          errorLevel       := status.errorLevel
          errorDescription := status.errorDescription
          markerSend       := status.markerSend
          valorNotifica    := status.valorNotifica
          age              := status.age
          securitas        := status.securitas
          cappitta         := status.cappitta
        }
      | .notifica => return Responsum.nihil  -- NOTIFY は Value を返さにゃいにゃ
    catch e =>
      -- 處理器内で例外が發生した場合は 500 + ErrorLevel/ErrorDescription を返すにゃ
      return { Responsum.errorInternus with
        errorLevel := some .error
        errorDescription := some (toString e) }
  | none =>
    -- 處理器が見つからにゃかった場合は 204 にゃ
    return Responsum.nihil

/-- 要求文字列を受け取り、應答文字列を返す一氣通貫の處理にゃん -/
def tractaCatenam (s : Shiori) (catenaRogationis : String) : IO String := do
  try
    match Rogatio.interpreta catenaRogationis with
    | .ok rogatio =>
      let responsum ← s.tracta rogatio
      return responsum.adProtocollum
    | .error nuntius =>
      return ({ Responsum.malaRogatio with
        errorLevel := some .admonitio
        errorDescription := some nuntius }).adProtocollum
  catch e =>
    return ({ Responsum.errorInternus with
      errorLevel := some .error
      errorDescription := some (toString e) }).adProtocollum

end Shiori

end Signaculum.Nucleus
