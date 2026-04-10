-- Signaculum.Utilia.ExpressioRegularis
-- 正規表現（エクスプレッシオー・レーグラーリス）にゃん♪
-- pandaman64/lean-regex ライブラリーのラッパーにゃ。
-- ゴースト開發でのテクストゥス處理に便利な關數を提供するにゃん

import Regex

namespace Signaculum.Utilia

open Regex

/-- 正規表現でテクストゥスを檢索するにゃん。
    最初のマッチとキャプチャグループを返すにゃ。
    マッチしなければ none にゃん -/
def quaereRE (exemplar textus : String) : Option (Array String) := do
  let re ← Regex.build exemplar |>.toOption
  let m ← re.find textus
  -- マッチ全體とキャプチャグループを配列にするにゃ
  let mut resultatus := #[m.fullMatch]
  for g in m.groups do
    match g with
    | some s => resultatus := resultatus.push s
    | none   => resultatus := resultatus.push ""
  return resultatus

/-- 正規表現でテクストゥスがマッチするか判定するにゃん -/
def congruatRE (exemplar textus : String) : Bool :=
  match Regex.build exemplar |>.toOption with
  | some re => re.test textus
  | none    => false

/-- 正規表現で全てのマッチを檢索するにゃん。マッチ文字列の配列を返すにゃ -/
def quaereOmnesRE (exemplar textus : String) : Array String :=
  match Regex.build exemplar |>.toOption with
  | some re => (re.findAll textus).map (·.fullMatch)
  | none    => #[]

/-- 正規表現でテクストゥスを置換するにゃん -/
def substitueRE (exemplar substitutio textus : String) : String :=
  match Regex.build exemplar |>.toOption with
  | some re => re.replaceAll textus substitutio
  | none    => textus

/-- 正規表現でテクストゥスを分割するにゃん -/
def scindeRE (exemplar textus : String) : Array String :=
  match Regex.build exemplar |>.toOption with
  | some re => re.split textus
  | none    => #[textus]

/-- マッチの數を數へるにゃん -/
def numeraRE (exemplar textus : String) : Nat :=
  match Regex.build exemplar |>.toOption with
  | some re => re.count textus
  | none    => 0

end Signaculum.Utilia
