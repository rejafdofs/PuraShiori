-- TestScriptum: scriptum マクロの追加テストにゃん♪
-- タグ種別ごとのユニットテストで、コンパイルが通ること自體がテスト成功にゃ
-- native_decide による出力文字列の正確さ檢證も含むにゃん

import Signaculum

open Signaculum.Sakura.Textus
open Signaculum.Sakura (loqui)

-- ═══════════════════════════════════════════════════
-- §1 表示・範圍制御タグ
-- ═══════════════════════════════════════════════════

-- \h, \u（直接タグ名）
example : Id.run (currereScriptum (scriptum! \h)) = "\\h" := by native_decide
example : Id.run (currereScriptum (scriptum! \u)) = "\\u" := by native_decide
-- \0, \1 は sakura/kero の別名なので \h/\u にシリアライズされるにゃ
example : Id.run (currereScriptum (scriptum! \0)) = "\\h" := by native_decide
example : Id.run (currereScriptum (scriptum! \1)) = "\\u" := by native_decide

-- \p[n]
example : Id.run (currereScriptum (scriptum! \p[2])) = "\\p[2]" := by native_decide

-- \s[n], \s[-1]
example : Id.run (currereScriptum (scriptum! \s[0])) = "\\s[0]" := by native_decide
example : Id.run (currereScriptum (scriptum! \s[5])) = "\\s[5]" := by native_decide
example : Id.run (currereScriptum (scriptum! \s[-1])) = "\\s[-1]" := by native_decide

-- \i[n]
example : Id.run (currereScriptum (scriptum! \i[0])) = "\\i[0]" := by native_decide
example : Id.run (currereScriptum (scriptum! \i[3, wait])) = "\\i[3,wait]" := by native_decide

-- ═══════════════════════════════════════════════════
-- §2 改行タグ
-- ═══════════════════════════════════════════════════

-- \n, \n[half]
example : Id.run (currereScriptum (scriptum! \n)) = "\\n" := by native_decide
example : Id.run (currereScriptum (scriptum! \n[half])) = "\\n[half]" := by native_decide

-- ═══════════════════════════════════════════════════
-- §3 清掃タグ
-- ═══════════════════════════════════════════════════

example : Id.run (currereScriptum (scriptum! \c)) = "\\c" := by native_decide
example : Id.run (currereScriptum (scriptum! \c[char, 5])) = "\\c[char,5]" := by native_decide
example : Id.run (currereScriptum (scriptum! \c[line, 3])) = "\\c[line,3]" := by native_decide
example : Id.run (currereScriptum (scriptum! \c[char, 5, 2])) = "\\c[char,5,2]" := by native_decide
example : Id.run (currereScriptum (scriptum! \c[line, 3, 1])) = "\\c[line,3,1]" := by native_decide
example : Id.run (currereScriptum (scriptum! \C)) = "\\C" := by native_decide

-- ═══════════════════════════════════════════════════
-- §4 待機タグ
-- ═══════════════════════════════════════════════════

-- \w9（moraCeler: 括弧なし形式 \wN で出力されるにゃ）
example : Id.run (currereScriptum (scriptum! \w9)) = "\\w9" := by native_decide

-- \_w[n]
example : Id.run (currereScriptum (scriptum! \_w[500])) = "\\_w[500]" := by native_decide

-- \__w[n]
example : Id.run (currereScriptum (scriptum! \__w[1000])) = "\\__w[1000]" := by native_decide

-- \x, \x[noclear]
example : Id.run (currereScriptum (scriptum! \x)) = "\\x" := by native_decide
example : Id.run (currereScriptum (scriptum! \x[noclear])) = "\\x[noclear]" := by native_decide

-- \t
example : Id.run (currereScriptum (scriptum! \t)) = "\\t" := by native_decide

-- ═══════════════════════════════════════════════════
-- §5 制御タグ
-- ═══════════════════════════════════════════════════

example : Id.run (currereScriptum (scriptum! \e)) = "\\e" := by native_decide
example : Id.run (currereScriptum (scriptum! \_q)) = "\\_q" := by native_decide
-- \v, \6, \7
example : Id.run (currereScriptum (scriptum! \v)) = "\\v" := by native_decide
example : Id.run (currereScriptum (scriptum! \6)) = "\\6" := by native_decide
example : Id.run (currereScriptum (scriptum! \7)) = "\\7" := by native_decide

-- ═══════════════════════════════════════════════════
-- §6 吹出しタグ
-- ═══════════════════════════════════════════════════

example : Id.run (currereScriptum (scriptum! \b[0])) = "\\b[0]" := by native_decide
example : Id.run (currereScriptum (scriptum! \b[2])) = "\\b[2]" := by native_decide
example : Id.run (currereScriptum (scriptum! \b[-1])) = "\\b[-1]" := by native_decide

-- ═══════════════════════════════════════════════════
-- §7 跳躍タグ
-- ═══════════════════════════════════════════════════

example : Id.run (currereScriptum (scriptum! \j[marker1])) = "\\j[marker1]" := by native_decide

-- ═══════════════════════════════════════════════════
-- §8 文字タグ（引數は文字列として渡すにゃ）
-- ═══════════════════════════════════════════════════

example : Id.run (currereScriptum (scriptum! \_u["0x2764"])) = "\\_u[0x2764]" := by native_decide
example : Id.run (currereScriptum (scriptum! \_m[msgtext])) = "\\_m[msgtext]" := by native_decide
example : Id.run (currereScriptum (scriptum! \_l["100", "200"])) = "\\_l[100,200]" := by native_decide

-- ═══════════════════════════════════════════════════
-- §9 エスケープタグ
-- ═══════════════════════════════════════════════════

example : Id.run (currereScriptum (scriptum! \{ \})) = "{}" := by native_decide

-- ═══════════════════════════════════════════════════
-- §10 複合テスト（複數タグの組合せ）
-- ═══════════════════════════════════════════════════

example : Id.run (currereScriptum (scriptum! \h \s[0] テスト \w9 にゃ \e))
  = "\\h\\s[0]テスト\\w9にゃ\\e" := by native_decide

example : Id.run (currereScriptum (let n := "名前"; scriptum! \h \s[0] {n} さん \e))
  = "\\h\\s[0]名前さん\\e" := by native_decide

-- ═══════════════════════════════════════════════════
-- §11 型チェックテスト（コンパイル通過＝成功）
-- ═══════════════════════════════════════════════════

def testumRaiseNoArg : SakuraIO Unit := do scriptum! \![raise, "OnTest"]
def testumSynchrona : SakuraIO Unit := do scriptum! \_s
def testumResourcea : SakuraIO Unit := do scriptum! \&[resource.png]
def testumMoraAnimatio : SakuraIO Unit := do scriptum! \__w[animation, 5]
def testumMoraClear : SakuraIO Unit := do scriptum! \__w[clear]
example : Id.run (currereScriptum (scriptum! \q[はい, "OnYes"])) = "\\q[はい,OnYes]" := by native_decide

-- ═══════════════════════════════════════════════════
-- §12 Lean コメント無視テスト
-- ═══════════════════════════════════════════════════

def testumCommentum : SakuraIO Unit := do
  scriptum!
    \h \s[0] -- こゝはコメントにゃ
    テストにゃ
    \e
