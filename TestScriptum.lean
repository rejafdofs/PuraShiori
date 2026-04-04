-- TestScriptum: scriptum マクロの追加テストにゃん♪
-- タグ種別ごとのユニットテストで、コンパイルが通ること自體がテスト成功にゃ
-- native_decide による出力文字列の正確さ檢證も含むにゃん

import Signaculum

open Signaculum.Sakura.Textus
open Signaculum.Sakura (loqui)

-- ═══════════════════════════════════════════════════
-- §1 表示・範圍制御タグ
-- ═══════════════════════════════════════════════════

-- \\h, \\u, \\0, \\1
example : Id.run (currereScriptum (scriptum! \h)) = "\\h" := by native_decide
example : Id.run (currereScriptum (scriptum! \u)) = "\\u" := by native_decide
example : Id.run (currereScriptum (scriptum! \0)) = "\\0" := by native_decide
example : Id.run (currereScriptum (scriptum! \1)) = "\\1" := by native_decide

-- \\p[n]
example : Id.run (currereScriptum (scriptum! \p[2])) = "\\p[2]" := by native_decide

-- \\s[n], \\s[-1]
example : Id.run (currereScriptum (scriptum! \s[0])) = "\\s[0]" := by native_decide
example : Id.run (currereScriptum (scriptum! \s[5])) = "\\s[5]" := by native_decide
example : Id.run (currereScriptum (scriptum! \s[-1])) = "\\s[-1]" := by native_decide

-- \\i[n], \\i[n, wait]
example : Id.run (currereScriptum (scriptum! \i[0])) = "\\i[0]" := by native_decide
example : Id.run (currereScriptum (scriptum! \i[3, wait])) = "\\i[3,wait]" := by native_decide

-- ═══════════════════════════════════════════════════
-- §2 改行タグ
-- ═══════════════════════════════════════════════════

-- \\n, \\n[half], \\n[percent, n]
example : Id.run (currereScriptum (scriptum! \n)) = "\\n" := by native_decide
example : Id.run (currereScriptum (scriptum! \n[half])) = "\\n[half]" := by native_decide
example : Id.run (currereScriptum (scriptum! \n[percent, 50])) = "\\n[percent,50]" := by native_decide
-- \\_n
example : Id.run (currereScriptum (scriptum! \_n)) = "\\_n" := by native_decide

-- ═══════════════════════════════════════════════════
-- §3 清掃タグ
-- ═══════════════════════════════════════════════════

-- \\c, \\c[char, n], \\c[line, n], \\c[char, n, i], \\c[line, n, i]
example : Id.run (currereScriptum (scriptum! \c)) = "\\c" := by native_decide
example : Id.run (currereScriptum (scriptum! \c[char, 5])) = "\\c[char,5]" := by native_decide
example : Id.run (currereScriptum (scriptum! \c[line, 3])) = "\\c[line,3]" := by native_decide
example : Id.run (currereScriptum (scriptum! \c[char, 5, 2])) = "\\c[char,5,2]" := by native_decide
example : Id.run (currereScriptum (scriptum! \c[line, 3, 1])) = "\\c[line,3,1]" := by native_decide
-- \\C
example : Id.run (currereScriptum (scriptum! \C)) = "\\C" := by native_decide

-- ═══════════════════════════════════════════════════
-- §4 待機タグ
-- ═══════════════════════════════════════════════════

-- \\w5, \\w[n]（パーサーが \\w の後の數字を直接讀む）
example : Id.run (currereScriptum (scriptum! \w9)) = "\\w[9]" := by native_decide

-- \\_w[n]
example : Id.run (currereScriptum (scriptum! \_w[500])) = "\\_w[500]" := by native_decide

-- \\__w[n], \\__w[animation, n]
example : Id.run (currereScriptum (scriptum! \__w[1000])) = "\\__w[1000]" := by native_decide

-- \\x, \\x[noclear]
example : Id.run (currereScriptum (scriptum! \x)) = "\\x" := by native_decide
example : Id.run (currereScriptum (scriptum! \x[noclear])) = "\\x[noclear]" := by native_decide

-- \\t
example : Id.run (currereScriptum (scriptum! \t)) = "\\t" := by native_decide

-- ═══════════════════════════════════════════════════
-- §5 制御タグ
-- ═══════════════════════════════════════════════════

example : Id.run (currereScriptum (scriptum! \e)) = "\\e" := by native_decide
example : Id.run (currereScriptum (scriptum! \_q)) = "\\_q" := by native_decide
example : Id.run (currereScriptum (scriptum! \-)) = "\\-" := by native_decide
example : Id.run (currereScriptum (scriptum! \+)) = "\\+" := by native_decide
example : Id.run (currereScriptum (scriptum! \*)) = "\\*" := by native_decide
example : Id.run (currereScriptum (scriptum! \4)) = "\\4" := by native_decide
example : Id.run (currereScriptum (scriptum! \5)) = "\\5" := by native_decide

-- ═══════════════════════════════════════════════════
-- §6 吹出しタグ
-- ═══════════════════════════════════════════════════

-- \\b[n], \\b[-1]
example : Id.run (currereScriptum (scriptum! \b[0])) = "\\b[0]" := by native_decide
example : Id.run (currereScriptum (scriptum! \b[2])) = "\\b[2]" := by native_decide
example : Id.run (currereScriptum (scriptum! \b[-1])) = "\\b[-1]" := by native_decide

-- ═══════════════════════════════════════════════════
-- §7 跳躍タグ
-- ═══════════════════════════════════════════════════

example : Id.run (currereScriptum (scriptum! \j[marker1])) = "\\j[marker1]" := by native_decide

-- ═══════════════════════════════════════════════════
-- §8 文字タグ
-- ═══════════════════════════════════════════════════

example : Id.run (currereScriptum (scriptum! \_u[0x2764])) = "\\_u[0x2764]" := by native_decide
example : Id.run (currereScriptum (scriptum! \_m[msgtext])) = "\\_m[msgtext]" := by native_decide
example : Id.run (currereScriptum (scriptum! \_l[100, 200])) = "\\_l[100,200]" := by native_decide

-- ═══════════════════════════════════════════════════
-- §9 エスケープタグ
-- ═══════════════════════════════════════════════════

example : Id.run (currereScriptum (scriptum! \{ \})) = "{}" := by native_decide

-- ═══════════════════════════════════════════════════
-- §10 複合テスト（複數タグの組合せ）
-- ═══════════════════════════════════════════════════

-- 基本的な會話パターンにゃ
example : Id.run (currereScriptum (scriptum! \h \s[0] テスト \w9 にゃ \e))
  = "\\h\\s[0]テスト\\w[9]にゃ\\e" := by native_decide

-- 式埋込と基本タグの混在にゃ
example : Id.run (currereScriptum (let n := "名前"; scriptum! \h \s[0] {n} さん \e))
  = "\\h\\s[0]名前さん\\e" := by native_decide

-- ═══════════════════════════════════════════════════
-- §11 型チェックテスト（コンパイル通過＝成功）
-- ═══════════════════════════════════════════════════

-- \\![raise] 型チェックにゃ
def testumRaiseNoArg : SakuraIO Unit := do scriptum! \![raise, "OnTest"]

-- 同期タグにゃ
def testumSynchrona : SakuraIO Unit := do scriptum! \_s

-- 資源參照にゃ
def testumResourcea : SakuraIO Unit := do scriptum! \&[resource.png]

-- \\__w[animation, n] にゃ
def testumMoraAnimatio : SakuraIO Unit := do scriptum! \__w[animation, 5]

-- \\__w[clear] にゃ
def testumMoraClear : SakuraIO Unit := do scriptum! \__w[clear]

-- 選擇肢の文字列形にゃ
example : Id.run (currereScriptum (scriptum! \q[はい, "OnYes"])) = "\\q[はい,OnYes]" := by native_decide

-- ═══════════════════════════════════════════════════
-- §12 Lean コメント無視テスト
-- ═══════════════════════════════════════════════════

-- コメントが scriptum ブロック内で正しく無視されるにゃ
def testumCommentum : SakuraIO Unit := do
  scriptum!
    \h \s[0] -- こゝはコメントにゃ
    テストにゃ
    \e
