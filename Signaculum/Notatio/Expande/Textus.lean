-- Signaculum.Notatio.Expande.Textus
-- テクストゥス・基本サクラスクリプトゥム・タグのディスパッチ關數にゃん♪
-- サブモジュールに分割して、此のファイルは統合ディスパッチのみを擔ふにゃ
--
-- 構造:
--   Textus/Imperium.lean   — 制御タグ (\\e, \\_q, \\-, \\+ 等) にゃん
--   Textus/Exhibitio.lean  — 表示・範圍・表面・改行・清掃・吹出し等にゃん
--   Textus/Mora.lean       — 待機タグ (\\w, \\_w, \\__w, \\x, \\t) にゃん
--   Textus/Selectio.lean   — 選擇肢・錨タグ (\\q, \\__q, \\_a) にゃん

import Lean
import Signaculum.Sakura.Scriptum
import Signaculum.Syntaxis
import Signaculum.Notatio.Expande.Auxilium
import Signaculum.Notatio.Expande.Textus.Imperium
import Signaculum.Notatio.Expande.Textus.Exhibitio
import Signaculum.Notatio.Expande.Textus.Mora
import Signaculum.Notatio.Expande.Textus.Selectio

namespace Signaculum.Notatio.Expande

open Lean Elab Term

/-- 基本サクラスクリプトゥム・タグの統合ディスパッチにゃん♪
    各サブモジュールに順に委譲し、處理できたら `some term` を返すにゃん -/
def expandeSignumTextus (nomen : String) (args : Array Lean.Syntax) (stx : Lean.Syntax)
    : TermElabM (Option (TSyntax `term)) := do
  -- 制御タグにゃ
  if let some t ← Textus.expandeImperium nomen args stx then return some t
  -- 表示系タグにゃ
  if let some t ← Textus.expandeExhibitio nomen args stx then return some t
  -- 待機タグにゃ
  if let some t ← Textus.expandeMora nomen args stx then return some t
  -- 選擇肢・錨タグにゃ
  if let some t ← Textus.expandeSelectio nomen args stx then return some t
  -- 此のモジュールで處理できないタグは none を返して次のディスパッチへ委ねるにゃん
  pure none

end Signaculum.Notatio.Expande
