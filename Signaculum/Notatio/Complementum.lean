-- Signaculum.Notatio.Complementum
-- scriptum マクロ用タグ入力補完にゃん♪
-- 全有效タグ名を名前空間に宣言し、Token Table 經由で IDE 補完を提供するにゃ

-- サクラスクリプトゥム・タグ專用シンタクスカテゴリにゃん♪
-- Token Table に登錄して keyword 補完を有效にするにゃ
-- 通常の term パーサーには干渉しないにゃん
declare_syntax_cat sakuratag

namespace Signaculum.Notatio.Complementum

-- ════════════════════════════════════════════════════
--  バックスラッシュタグ (Signa)
-- ════════════════════════════════════════════════════

namespace Signa

-- 範圍制御 (Imperium Scopi)
/-- \h — さくら側（主人格）に切り替へ -/
def «\h» : Unit := ()
/-- \u — うにゅう側（副人格）に切り替へ -/
def «\u» : Unit := ()
/-- \0 — さくら側に切り替へ（\h と同義） -/
def «\0» : Unit := ()
/-- \1 — うにゅう側に切り替へ（\u と同義） -/
def «\1» : Unit := ()
/-- \p — 第n人格に切り替へ。\p[n] -/
def «\p» : Unit := ()

-- 表面制御 (Imperium Superficiei)
/-- \s — 表面（サーフェス）制御。\s[n] / \s[-1] -/
def «\s» : Unit := ()
/-- \i — アニメーション。\i[n] / \i[n, wait] -/
def «\i» : Unit := ()

-- 改行 (Lineae)
/-- \n — 改行。\n / \n[half] / \n[percent, n] -/
def «\n» : Unit := ()
/-- \_n — 自動改行抑制 -/
def «\_n» : Unit := ()

-- 清掃 (Purgatio)
/-- \c — バルーン消去。\c / \c[char, n] / \c[line, n] -/
def «\c» : Unit := ()
/-- \C — 追記モード -/
def «\C» : Unit := ()

-- 待機 (Mora)
/-- \w — 簡易ウェイト。\w n -/
def «\w» : Unit := ()
/-- \_w — ミリ秒ウェイト。\_w[ms] -/
def «\_w» : Unit := ()
/-- \__w — 絕對ウェイト / アニメーション待機。\__w[ms] / \__w[animation, n] / \__w[clear] -/
def «\__w» : Unit := ()
/-- \x — クリック待ち。\x / \x[noclear] -/
def «\x» : Unit := ()
/-- \t — 時間クリティカルセクション -/
def «\t» : Unit := ()

-- 制御 (Imperium)
/-- \e — スクリプト終了 -/
def «\e» : Unit := ()
/-- \_q — 即時表示モード -/
def «\_q» : Unit := ()
/-- \- — ゴースト終了 -/
def «\-» : Unit := ()
/-- \+ — ゴースト切替 -/
def «\+» : Unit := ()
/-- \_+ — 次のゴーストに切替 -/
def «\_+» : Unit := ()
/-- \v — 前面表示トグル -/
def «\v» : Unit := ()
/-- \4 — 後退（undo） -/
def «\4» : Unit := ()
/-- \5 — 前進（redo） -/
def «\5» : Unit := ()
/-- \6 — 時刻同期 -/
def «\6» : Unit := ()
/-- \7 — 時刻イヴェント -/
def «\7» : Unit := ()
/-- \_? — タグ抑制 -/
def «\_?» : Unit := ()
/-- \_V — 音聲再生完了待ち -/
def «\_V» : Unit := ()
/-- \* — タイムアウト抑制 -/
def «\*» : Unit := ()

-- 同期 (Synchronia)
/-- \_s — スコープ同期。\_s / \_s[n, ...] -/
def «\_s» : Unit := ()

-- 吹出し (Bulla)
/-- \b — バルーン制御。\b[n] / \b[-1] -/
def «\b» : Unit := ()

-- 跳躍 (Saltum)
/-- \j — ラベルジャンプ。\j["label"] -/
def «\j» : Unit := ()

-- 錨 (Ancora)
/-- \_a — アンカー。\_a[callback, ...] / \_a（アンカー終了） -/
def «\_a» : Unit := ()

-- 選擇肢 (Optiones)
/-- \q — 選択肢。\q["title", callback] / \q["title", "id"] -/
def «\q» : Unit := ()
/-- \__q — 選択肢スコープ。\__q[callback] / \__q（スコープ終了） -/
def «\__q» : Unit := ()

-- 文字 (Characteres)
/-- \_u — Unicode 文字。\_u["code"] -/
def «\_u» : Unit := ()
/-- \_m — メッセージ文字。\_m["code"] -/
def «\_m» : Unit := ()
/-- \_l — カーソル位置。\_l["x", "y"] -/
def «\_l» : Unit := ()

-- 資源 (Resourcea)
/-- \& — リソース参照。\&["path"] -/
def «\&» : Unit := ()

-- エスケープ (Evasiones)
/-- \{ — 左波括弧リテラル -/
def «\{» : Unit := ()
/-- \} — 右波括弧リテラル -/
def «\}» : Unit := ()

-- 窓制御 (Fenestrae)
/-- \z — ズーム。\z[n] -/
def «\z» : Unit := ()
/-- \_b — バルーン画像。\_b[v, x, y] / \_b[v, inline] -/
def «\_b» : Unit := ()

-- 音響 (Sonus)
/-- \_v — 音声再生。\_v["file"] -/
def «\_v» : Unit := ()
/-- \8 — 簡易波形再生。\8["file"] -/
def «\8» : Unit := ()
/-- \__v — 音声合成。\__v["option"] -/
def «\__v» : Unit := ()

-- Windows メッセージ
/-- \m — Windows メッセージ。\m["umsg", "wparam", "lparam"] -/
def «\m» : Unit := ()

-- 特殊タグ
/-- \! — システムコマンド。\![cmd, args...] -/
def «\!» : Unit := ()
/-- \f — フォント制御。\f[key, values...] -/
def «\f» : Unit := ()

end Signa

-- ════════════════════════════════════════════════════
--  \! コマンド (Imperium)
-- ════════════════════════════════════════════════════

namespace Imperium

-- 事象系 (Eventum)
/-- raise — イヴェント発生 -/
def raise : Unit := ()
/-- embed — 埋込イヴェント -/
def embed : Unit := ()
/-- notify — 通知イヴェント -/
def notify : Unit := ()
/-- timerraise — タイマーイヴェント発生 -/
def timerraise : Unit := ()
/-- timernotify — タイマー通知 -/
def timernotify : Unit := ()
/-- raiseother — 他ゴーストへイヴェント -/
def raiseother : Unit := ()
/-- notifyother — 他ゴーストへ通知 -/
def notifyother : Unit := ()
/-- timerraiseother — 他ゴーストへタイマーイヴェント -/
def timerraiseother : Unit := ()
/-- timernotifyother — 他ゴーストへタイマー通知 -/
def timernotifyother : Unit := ()
/-- raiseplugin — プラグインへイヴェント -/
def raiseplugin : Unit := ()
/-- notifyplugin — プラグインへ通知 -/
def notifyplugin : Unit := ()
/-- timerraiseplugin — プラグインへタイマーイヴェント -/
def timerraiseplugin : Unit := ()
/-- timernotifyplugin — プラグインへタイマー通知 -/
def timernotifyplugin : Unit := ()
/-- async — 非同期イヴェント -/
def async : Unit := ()

-- 音響系 (Sonus)
/-- sound — 音響制御。\![sound, play/stop/...] -/
def sound : Unit := ()

-- 動畫系 (Animatio)
/-- anim — アニメーション制御。\![anim, start/stop/...] -/
def anim : Unit := ()

-- 實行系 (Executio)
/-- execute — 実行コマンド。\![execute, http-get/...] -/
def execute : Unit := ()

-- 移動・可視性 (Motus)
/-- move — ゴースト移動。\![move, sx, sy, kx, ky] -/
def move : Unit := ()
/-- moveasync — 非同期移動。\![moveasync, sx, sy, kx, ky] / \![moveasync, cancel] -/
def moveasync : Unit := ()
/-- vanish — ゴースト消滅 -/
def vanish : Unit := ()
/-- restore — ゴースト復元 -/
def restore : Unit := ()
/-- reboot — ゴースト再起動 -/
def reboot : Unit := ()
/-- quicksession — クイックセッション -/
def quicksession : Unit := ()
/-- quicksection — クイックセクション -/
def quicksection : Unit := ()
/-- create — 作成。\![create, shortcut] -/
def create : Unit := ()

-- ロック・アンロック (Sera)
/-- lock — ロック。\![lock, repaint] 等 -/
def lock : Unit := ()
/-- unlock — アンロック。\![unlock, repaint] 等 -/
def unlock : Unit := ()

-- モード制御 (Modi)
/-- enter — モード開始。\![enter, passivemode] 等 -/
def enter : Unit := ()
/-- leave — モード終了。\![leave, passivemode] 等 -/
def leave : Unit := ()

-- リセット (Renovatio)
/-- reset — リセット。\![reset, position] 等 -/
def reset : Unit := ()

-- 開閉 (Aperitio)
/-- open — ウィンドウ・ダイアログを開く -/
def «open» : Unit := ()
/-- close — ウィンドウを閉じる -/
def «close» : Unit := ()

-- 殘餘 (Reliqua)
/-- call — ゴースト呼出 -/
def call : Unit := ()
/-- change — ゴースト切替 -/
def change : Unit := ()
/-- updatebymyself — 自己アップデート -/
def updatebymyself : Unit := ()
/-- vanishbymyself — 自己消滅 -/
def vanishbymyself : Unit := ()
/-- executesntp — SNTP 実行 -/
def executesntp : Unit := ()
/-- reloadsurface — サーフェスリロード -/
def reloadsurface : Unit := ()
/-- reload — リロード -/
def reload : Unit := ()
/-- unload — アンロード -/
def unload : Unit := ()
/-- load — ロード -/
def load : Unit := ()
/-- bind — バインド -/
def bind : Unit := ()
/-- effect — エフェクト -/
def effect : Unit := ()
/-- effect2 — エフェクト2 -/
def effect2 : Unit := ()
/-- biff — メール通知 -/
def biff : Unit := ()
/-- set — 設定変更 -/
def set : Unit := ()
/-- get — 設定取得 -/
def get : Unit := ()
/-- filter — フィルター -/
def filter : Unit := ()
/-- wait — 待機 -/
def wait : Unit := ()
/-- update — アップデート -/
def update : Unit := ()

end Imperium

-- ════════════════════════════════════════════════════
--  \f フォントキー (Clavis)
-- ════════════════════════════════════════════════════

namespace Clavis

-- Bool 系 (Booleana)
/-- bold — 太字。\f[bold, true/false] -/
def bold : Unit := ()
/-- italic — 斜体。\f[italic, true/false] -/
def italic : Unit := ()
/-- strike — 取消線。\f[strike, true/false] -/
def strike : Unit := ()
/-- underline — 下線。\f[underline, true/false] -/
def underline : Unit := ()
/-- sub — 下付き。\f[sub, true/false] -/
def sub : Unit := ()
/-- sup — 上付き。\f[sup, true/false] -/
def sup : Unit := ()

-- 色系 (Colores)
/-- color — 文字色。\f[color, r, g, b] / \f[color, "hex"] -/
def color : Unit := ()
/-- shadowcolor — 影色。\f[shadowcolor, r, g, b] -/
def shadowcolor : Unit := ()

-- 文字サイズ (Magnitudo)
/-- height — 文字サイズ。\f[height, n] / \f[height, +, n] / \f[height, n, %] -/
def height : Unit := ()

-- フォント名 (Nomen)
/-- name — フォント名。\f[name, "fontname"] -/
def name : Unit := ()

-- 影・輪郭 (Umbra et Contornus)
/-- shadowstyle — 影スタイル。\f[shadowstyle, offset/outline/default] -/
def shadowstyle : Unit := ()
/-- outline — 輪郭。\f[outline, true/false/default/disable] -/
def outline : Unit := ()

-- 方向 (Directiones)
/-- align — 横方向揃え。\f[align, left/right/center/justify] -/
def align : Unit := ()
/-- valign — 縦方向揃え。\f[valign, top/middle/bottom] -/
def valign : Unit := ()

-- パラメータなし (Sine Parametris)
/-- disable — フォント設定無効化 -/
def disable : Unit := ()
/-- default — フォント設定デフォルト -/
def default : Unit := ()

-- カーソル選擇中 (Cursor Electi)
/-- cursorstyle — カーソル選択中のスタイル -/
def cursorstyle : Unit := ()
/-- cursorcolor — カーソル選択中の色 -/
def cursorcolor : Unit := ()
/-- cursorbrushcolor — カーソル選択中のブラシ色 -/
def cursorbrushcolor : Unit := ()
/-- cursorpencolor — カーソル選択中のペン色 -/
def cursorpencolor : Unit := ()
/-- cursorfontcolor — カーソル選択中のフォント色 -/
def cursorfontcolor : Unit := ()
/-- cursormethod — カーソル選択中の描画方法 -/
def cursormethod : Unit := ()

-- カーソル未選擇 (Cursor Non Electi)
/-- cursornotselectstyle — カーソル未選択のスタイル -/
def cursornotselectstyle : Unit := ()
/-- cursornotselectcolor — カーソル未選択の色 -/
def cursornotselectcolor : Unit := ()
/-- cursornotselectbrushcolor — カーソル未選択のブラシ色 -/
def cursornotselectbrushcolor : Unit := ()
/-- cursornotselectpencolor — カーソル未選択のペン色 -/
def cursornotselectpencolor : Unit := ()
/-- cursornotselectfontcolor — カーソル未選択のフォント色 -/
def cursornotselectfontcolor : Unit := ()
/-- cursornotselectmethod — カーソル未選択の描画方法 -/
def cursornotselectmethod : Unit := ()

-- 錨選擇中 (Ancora Electa)
/-- anchorstyle — アンカー選択中のスタイル -/
def anchorstyle : Unit := ()
/-- anchorcolor — アンカー選択中の色 -/
def anchorcolor : Unit := ()
/-- anchorbrushcolor — アンカー選択中のブラシ色 -/
def anchorbrushcolor : Unit := ()
/-- anchorpencolor — アンカー選択中のペン色 -/
def anchorpencolor : Unit := ()
/-- anchorfontcolor — アンカー選択中のフォント色 -/
def anchorfontcolor : Unit := ()
/-- anchormethod — アンカー選択中の描画方法 -/
def anchormethod : Unit := ()

-- 錨未選擇 (Ancora Non Electa)
/-- anchornotselectstyle — アンカー未選択のスタイル -/
def anchornotselectstyle : Unit := ()
/-- anchornotselectcolor — アンカー未選択の色 -/
def anchornotselectcolor : Unit := ()
/-- anchornotselectbrushcolor — アンカー未選択のブラシ色 -/
def anchornotselectbrushcolor : Unit := ()
/-- anchornotselectpencolor — アンカー未選択のペン色 -/
def anchornotselectpencolor : Unit := ()
/-- anchornotselectfontcolor — アンカー未選択のフォント色 -/
def anchornotselectfontcolor : Unit := ()
/-- anchornotselectmethod — アンカー未選択の描画方法 -/
def anchornotselectmethod : Unit := ()

-- 錨訪問済み (Ancora Visa)
/-- anchorvisitedstyle — アンカー訪問済みのスタイル -/
def anchorvisitedstyle : Unit := ()
/-- anchorvisitedcolor — アンカー訪問済みの色 -/
def anchorvisitedcolor : Unit := ()
/-- anchorvisitedbrushcolor — アンカー訪問済みのブラシ色 -/
def anchorvisitedbrushcolor : Unit := ()
/-- anchorvisitedpencolor — アンカー訪問済みのペン色 -/
def anchorvisitedpencolor : Unit := ()
/-- anchorvisitedfontcolor — アンカー訪問済みのフォント色 -/
def anchorvisitedfontcolor : Unit := ()
/-- anchorvisitedmethod — アンカー訪問済みの描画方法 -/
def anchorvisitedmethod : Unit := ()

-- 錨テクストゥス全體色
/-- anchor.font.color — アンカーテキスト全体の色 -/
def «anchor.font.color» : Unit := ()

end Clavis

end Signaculum.Notatio.Complementum

-- ════════════════════════════════════════════════════
--  Token Table 登錄にゃん♪
--  sakuratag カテゴリへの syntax 宣言で token table に登錄するにゃ
--  通常の term パーサーには干渉しないにゃん
-- ════════════════════════════════════════════════════

-- バックスラッシュタグにゃ
syntax "\\h" : sakuratag
syntax "\\u" : sakuratag
syntax "\\0" : sakuratag
syntax "\\1" : sakuratag
syntax "\\p" : sakuratag
syntax "\\s" : sakuratag
syntax "\\i" : sakuratag
syntax "\\n" : sakuratag
syntax "\\_n" : sakuratag
syntax "\\c" : sakuratag
syntax "\\C" : sakuratag
syntax "\\w" : sakuratag
syntax "\\_w" : sakuratag
syntax "\\__w" : sakuratag
syntax "\\x" : sakuratag
syntax "\\t" : sakuratag
syntax "\\e" : sakuratag
syntax "\\_q" : sakuratag
syntax "\\-" : sakuratag
syntax "\\+" : sakuratag
syntax "\\_+" : sakuratag
syntax "\\v" : sakuratag
syntax "\\4" : sakuratag
syntax "\\5" : sakuratag
syntax "\\6" : sakuratag
syntax "\\7" : sakuratag
syntax "\\_?" : sakuratag
syntax "\\_V" : sakuratag
syntax "\\*" : sakuratag
syntax "\\_s" : sakuratag
syntax "\\b" : sakuratag
syntax "\\j" : sakuratag
syntax "\\_a" : sakuratag
syntax "\\q" : sakuratag
syntax "\\__q" : sakuratag
syntax "\\_u" : sakuratag
syntax "\\_m" : sakuratag
syntax "\\_l" : sakuratag
syntax "\\&" : sakuratag
syntax "\\z" : sakuratag
syntax "\\_b" : sakuratag
syntax "\\_v" : sakuratag
syntax "\\8" : sakuratag
syntax "\\__v" : sakuratag
syntax "\\m" : sakuratag
syntax "\\f" : sakuratag
