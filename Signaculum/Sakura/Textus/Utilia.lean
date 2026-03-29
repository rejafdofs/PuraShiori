-- Signaculum.Sakura.Textus.Utilia
-- 便利な組合せ・無作爲選擇・實行關數にゃん♪

import Signaculum.Sakura.Fundamentum

namespace Signaculum.Sakura.Textus

-- ════════════════════════════════════════════════════
--  便利にゃ組合せ (Combinationes Utiles)
-- ════════════════════════════════════════════════════

/-- 文字列を表示して改行するにゃん -/
def loquiEtLinea {m : Type → Type} [Monad m] (s : String) : SakuraM m Unit := do
  loqui s; emitte (.exhibitionis .linea)

/-- 主人格で表面を設定してから喋るにゃん -/
def sakuraLoquitur {m : Type → Type} [Monad m]
    (sup : Nat) (s : String) : SakuraM m Unit := do
  emitte (.scopi .sakura); emitte (.superficiei (.superficies sup)); loqui s

/-- 副人格で表面を設定してから喋るにゃん -/
def keroLoquitur {m : Type → Type} [Monad m]
    (sup : Nat) (s : String) : SakuraM m Unit := do
  emitte (.scopi .kero); emitte (.superficiei (.superficies sup)); loqui s

-- ════════════════════════════════════════════════════
--  無作爲 (Fortuita) — ランダム選擇
-- ════════════════════════════════════════════════════

/-- 配列からランダムに1つ選ぶにゃん。空配列なら空文字列を返すにゃ。
    インデックスは `i % n` で計算するから、配列アクセスは常に安全にゃ♪ -/
def elige (optiones : Array String) : IO String := do
  if h : optiones.size = 0 then return ""
  else
    let n := optiones.size
    let index ← IO.rand 0 (n - 1)
    let i := index % n
    have hi : i < n := Nat.mod_lt index (by omega)
    return optiones[i]

/-- 配列からランダムに1つ選んで表示するにゃん。
    `elige` + `loqui` の便利關數にゃ♪
    ```
    fortuito #["やっほー！", "こんにちは！", "おはよう！"]
    ``` -/
def fortuito (optiones : Array String) : SakuraIO Unit := do
  let s ← elige optiones
  loqui s

-- ════════════════════════════════════════════════════
--  實行 (Executio)
-- ════════════════════════════════════════════════════

/-- サクラスクリプト・モナドを實行し、蓄積された StatusSakurae を得るにゃん。
    スクリプトゥム文字列だけでなく Marker 等の附加ヘッダーも含むにゃ -/
def currere {m : Type → Type} [Monad m]
    (scriptum : SakuraM m Unit) (initium : StatusSakurae := {}) : m StatusSakurae := do
  let (_, resultatum) ← StateT.run scriptum initium
  return resultatum

/-- サクラスクリプト・モナドを實行し、蓄積されたスクリプトゥム文字列だけを得るにゃん。
    附加ヘッダーが不要な時はこちらを使ふにゃ -/
def currereScriptum {m : Type → Type} [Monad m]
    (scriptum : SakuraM m Unit) (initium : List Signum := []) : m String := do
  let (_, resultatum) ← StateT.run scriptum { scriptum := initium }
  return adCatenamLista resultatum.scriptum

end Signaculum.Sakura.Textus
