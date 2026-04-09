-- Signaculum.Protocollum.NominaEventuum
-- 標準SHIORIイベント名のラッパーにゃん♪
-- あやりりす風の日本語定數を提供するにゃ
-- ukadoc (http://ssp.shillest.net/ukadoc/manual/list_shiori_event.html) 準據にゃん

set_option autoImplicit false

namespace Signaculum.Protocollum.NominaEventuum

-- ═══════════════════════════════════════════════════
--  起動・終了・切替 (Inceptio / Clausura / Mutatio)
-- ═══════════════════════════════════════════════════

/-- ゴースト起動時にゃん。他ゴーストからの切替時にも發生するにゃ -/
def «起動» := "OnBoot"

/-- 初囘起動時にゃん。インストール直後の一度きりにゃ -/
def «初回起動» := "OnFirstBoot"

/-- ゴースト終了時にゃん -/
def «終了» := "OnClose"

/-- 全ゴースト一括終了時にゃん -/
def «全終了» := "OnCloseAll"

/-- 他ゴーストへ切替中にゃん（自分が消える前）-/
def «ゴースト切替時» := "OnGhostChanging"

/-- 他ゴーストから切替後にゃん（自分が現れた後）-/
def «ゴースト切替後» := "OnGhostChanged"

/-- 他ゴーストを呼び出し中にゃん -/
def «ゴースト呼出時» := "OnGhostCalling"

/-- 他ゴーストから呼び出された時にゃん -/
def «ゴースト呼出後» := "OnGhostCalled"

/-- ゴースト呼出完了時にゃん -/
def «ゴースト呼出完了» := "OnGhostCallComplete"

/-- 他ゴーストが起動した時にゃん -/
def «他ゴースト起動» := "OnOtherGhostBooted"

/-- 他ゴーストが切り替はった時にゃん -/
def «他ゴースト切替» := "OnOtherGhostChanged"

/-- 他ゴーストが終了した時にゃん -/
def «他ゴースト終了» := "OnOtherGhostClosed"

/-- シェル切替中にゃん -/
def «シェル切替時» := "OnShellChanging"

/-- シェル切替後にゃん -/
def «シェル切替後» := "OnShellChanged"

/-- 着せ替へ変更時にゃん -/
def «着せ替え変更» := "OnDressupChanged"

/-- バルーン変更時にゃん -/
def «バルーン変更» := "OnBalloonChange"

/-- ウィンドウ復元時にゃん -/
def «ウィンドウ復元» := "OnWindowStateRestore"

/-- ウィンドウ最小化時にゃん -/
def «ウィンドウ最小化» := "OnWindowStateMinimize"

/-- フルスクリーンアプリ最小化時にゃん -/
def «フルスクリーン最小化» := "OnFullScreenAppMinimize"

/-- フルスクリーンアプリ復元時にゃん -/
def «フルスクリーン復元» := "OnFullScreenAppRestore"

/-- 仮想デスクトップ切替時にゃん -/
def «仮想デスクトップ変更» := "OnVirtualDesktopChanged"

/-- キャッシュ休止時にゃん -/
def «キャッシュ休止» := "OnCacheSuspend"

/-- キャッシュ復元時にゃん -/
def «キャッシュ復元» := "OnCacheRestore"

/-- 初期化時にゃん -/
def «初期化» := "OnInitialize"

/-- 破棄時にゃん -/
def «破棄» := "OnDestroy"

/-- OS復帰時にゃん（スリープ/休止から復歸）-/
def «OS復帰» := "OnSysResume"

/-- OS休止時にゃん（スリープ/休止に入る）-/
def «OS休止» := "OnSysSuspend"

/-- ベースウェア更新中にゃん -/
def «ベースウェア更新中» := "OnBasewareUpdating"

/-- ベースウェア更新後にゃん -/
def «ベースウェア更新後» := "OnBasewareUpdated"

-- ═══════════════════════════════════════════════════
--  マウス (Mus)
-- ═══════════════════════════════════════════════════

/-- マウスクリック時にゃん -/
def «クリック» := "OnMouseClick"

/-- マウスクリック時（拡張）にゃん -/
def «クリックEx» := "OnMouseClickEx"

/-- マウスダブルクリック時にゃん -/
def «ダブルクリック» := "OnMouseDoubleClick"

/-- マウスダブルクリック時（拡張）にゃん -/
def «ダブルクリックEx» := "OnMouseDoubleClickEx"

/-- マウスマルチクリック時にゃん -/
def «マルチクリック» := "OnMouseMultipleClick"

/-- マウスマルチクリック時（拡張）にゃん -/
def «マルチクリックEx» := "OnMouseMultipleClickEx"

/-- マウスボタン離し時にゃん -/
def «マウスアップ» := "OnMouseUp"

/-- マウスボタン離し時（拡張）にゃん -/
def «マウスアップEx» := "OnMouseUpEx"

/-- マウスボタン押下時にゃん -/
def «マウスダウン» := "OnMouseDown"

/-- マウスボタン押下時（拡張）にゃん -/
def «マウスダウンEx» := "OnMouseDownEx"

/-- マウス移動時にゃん -/
def «マウス移動» := "OnMouseMove"

/-- マウスホイール回転時にゃん -/
def «マウスホイール» := "OnMouseWheel"

/-- マウスがゴースト領域に入った時（全体）にゃん -/
def «マウス進入全体» := "OnMouseEnterAll"

/-- マウスがゴースト領域を出た時（全体）にゃん -/
def «マウス退出全体» := "OnMouseLeaveAll"

/-- マウスが當たり判定に入った時にゃん -/
def «マウス進入» := "OnMouseEnter"

/-- マウスが當たり判定を出た時にゃん -/
def «マウス退出» := "OnMouseLeave"

/-- ドラッグ開始時にゃん -/
def «ドラッグ開始» := "OnMouseDragStart"

/-- ドラッグ終了時にゃん -/
def «ドラッグ終了» := "OnMouseDragEnd"

/-- マウスホバー時にゃん -/
def «マウスホバー» := "OnMouseHover"

/-- マウスジェスチャー時にゃん -/
def «マウスジェスチャー» := "OnMouseGesture"

-- ═══════════════════════════════════════════════════
--  選択肢 (Optio)
-- ═══════════════════════════════════════════════════

/-- 選択肢が選ばれた時にゃん -/
def «選択肢選択» := "OnChoiceSelect"

/-- 選択肢が選ばれた時（拡張）にゃん -/
def «選択肢選択Ex» := "OnChoiceSelectEx"

/-- 選択肢にマウスが入った時にゃん -/
def «選択肢進入» := "OnChoiceEnter"

/-- 選択肢がタイムアウトした時にゃん -/
def «選択肢タイムアウト» := "OnChoiceTimeout"

/-- 選択肢にホバーした時にゃん -/
def «選択肢ホバー» := "OnChoiceHover"

/-- アンカーが選ばれた時にゃん -/
def «アンカー選択» := "OnAnchorSelect"

/-- アンカーが選ばれた時（拡張）にゃん -/
def «アンカー選択Ex» := "OnAnchorSelectEx"

/-- アンカーにマウスが入った時にゃん -/
def «アンカー進入» := "OnAnchorEnter"

/-- アンカーにホバーした時にゃん -/
def «アンカーホバー» := "OnAnchorHover"

-- ═══════════════════════════════════════════════════
--  時間 (Tempus)
-- ═══════════════════════════════════════════════════

/-- 毎秒にゃん -/
def «毎秒» := "OnSecondChange"

/-- 毎分にゃん -/
def «毎分» := "OnMinuteChange"

/-- 時報にゃん -/
def «時報» := "OnHourTimeSignal"

-- ═══════════════════════════════════════════════════
--  サーフェス (Superficies)
-- ═══════════════════════════════════════════════════

/-- サーフェス変更時にゃん -/
def «サーフェス変更» := "OnSurfaceChange"

/-- サーフェス復元時にゃん -/
def «サーフェス復元» := "OnSurfaceRestore"

/-- 他キャラのサーフェス変更時にゃん -/
def «他サーフェス変更» := "OnOtherSurfaceChange"

-- ═══════════════════════════════════════════════════
--  入力 (Inputum)
-- ═══════════════════════════════════════════════════

/-- ユーザに教はる開始時にゃん -/
def «教えて開始» := "OnTeachStart"

/-- ユーザに教はる入力取消時にゃん -/
def «教えて入力取消» := "OnTeachInputCancel"

/-- ユーザに教はった時にゃん -/
def «教えて» := "OnTeach"

/-- コミュニケート時にゃん -/
def «コミュニケート» := "OnCommunicate"

/-- コミュニケート入力取消時にゃん -/
def «コミュニケート取消» := "OnCommunicateInputCancel"

/-- ユーザ入力時にゃん -/
def «ユーザ入力» := "OnUserInput"

/-- ユーザ入力取消時にゃん -/
def «ユーザ入力取消» := "OnUserInputCancel"

-- ═══════════════════════════════════════════════════
--  ダイアログ (Dialogus)
-- ═══════════════════════════════════════════════════

/-- システムダイアログ時にゃん -/
def «システムダイアログ» := "OnSystemDialog"

/-- システムダイアログ取消時にゃん -/
def «システムダイアログ取消» := "OnSystemDialogCancel"

/-- 設定ダイアログヘルプ時にゃん -/
def «設定ダイアログヘルプ» := "OnConfigurationDialogHelp"

/-- ゴースト利用規約同意時にゃん -/
def «利用規約同意» := "OnGhostTermsAccept"

/-- ゴースト利用規約拒否時にゃん -/
def «利用規約拒否» := "OnGhostTermsDecline"

-- ═══════════════════════════════════════════════════
--  バルーン (Bulla)
-- ═══════════════════════════════════════════════════

/-- バルーン中断時にゃん（ユーザがクリックして中斷した時）-/
def «バルーン中断» := "OnBalloonBreak"

/-- バルーン閉鎖時にゃん -/
def «バルーン閉鎖» := "OnBalloonClose"

/-- バルーンタイムアウト時にゃん -/
def «バルーンタイムアウト» := "OnBalloonTimeout"

-- ═══════════════════════════════════════════════════
--  消滅 (Evanitio)
-- ═══════════════════════════════════════════════════

/-- 消滅選択中にゃん -/
def «消滅選択中» := "OnVanishSelecting"

/-- 消滅が選択された時にゃん -/
def «消滅選択» := "OnVanishSelected"

/-- 消滅取消時にゃん -/
def «消滅取消» := "OnVanishCancel"

/-- 消滅ボタン長押し時にゃん -/
def «消滅長押し» := "OnVanishButtonHold"

/-- 消滅後にゃん -/
def «消滅後» := "OnVanished"

/-- 他ゴースト消滅時にゃん -/
def «他ゴースト消滅» := "OnOtherGhostVanished"

-- ═══════════════════════════════════════════════════
--  インストール (Installatio)
-- ═══════════════════════════════════════════════════

/-- インストール開始時にゃん -/
def «インストール開始» := "OnInstallBegin"

/-- インストール完了時にゃん -/
def «インストール完了» := "OnInstallComplete"

/-- インストール完了時（拡張）にゃん -/
def «インストール完了Ex» := "OnInstallCompleteEx"

/-- インストール全完了時にゃん -/
def «インストール全完了» := "OnInstallCompleteAll"

/-- インストール失敗時にゃん -/
def «インストール失敗» := "OnInstallFailure"

/-- インストール拒否時にゃん -/
def «インストール拒否» := "OnInstallRefuse"

/-- インストール転送時にゃん -/
def «インストール転送» := "OnInstallReroute"

-- ═══════════════════════════════════════════════════
--  ファイルドロップ (Demissio Fasciculi)
-- ═══════════════════════════════════════════════════

/-- ファイルドロップ中にゃん -/
def «ファイルドロップ中» := "OnFileDropping"

/-- ファイルドロップ完了時にゃん -/
def «ファイルドロップ完了» := "OnFileDropped"

/-- ファイルドロップ時にゃん -/
def «ファイルドロップ» := "OnFileDrop"

/-- ファイルドロップ時（拡張）にゃん -/
def «ファイルドロップEx» := "OnFileDropEx"

/-- フォルダドロップ時にゃん -/
def «フォルダドロップ» := "OnDirectoryDrop"

/-- 壁紙変更時にゃん -/
def «壁紙変更» := "OnWallpaperChange"

-- ═══════════════════════════════════════════════════
--  ネットワーク更新 (Renovatio)
-- ═══════════════════════════════════════════════════

/-- ネットワーク更新開始時にゃん -/
def «更新開始» := "OnUpdateBegin"

/-- ネットワーク更新準備完了時にゃん -/
def «更新準備完了» := "OnUpdateReady"

/-- ネットワーク更新完了時にゃん -/
def «更新完了» := "OnUpdateComplete"

/-- ネットワーク更新失敗時にゃん -/
def «更新失敗» := "OnUpdateFailure"

/-- 更新結果にゃん -/
def «更新結果» := "OnUpdateResult"

/-- 更新結果（拡張）にゃん -/
def «更新結果Ex» := "OnUpdateResultEx"

/-- 更新チェック完了時にゃん -/
def «更新チェック完了» := "OnUpdateCheckComplete"

/-- 更新チェック失敗時にゃん -/
def «更新チェック失敗» := "OnUpdateCheckFailure"

-- ═══════════════════════════════════════════════════
--  キーボード (Clavis)
-- ═══════════════════════════════════════════════════

/-- キー入力時にゃん -/
def «キー入力» := "OnKeyPress"

-- ═══════════════════════════════════════════════════
--  OS状態 (Status Operandi Systematis)
-- ═══════════════════════════════════════════════════

/-- スクリーンセーバー開始時にゃん -/
def «スクリーンセーバー開始» := "OnScreenSaverStart"

/-- スクリーンセーバー終了時にゃん -/
def «スクリーンセーバー終了» := "OnScreenSaverEnd"

/-- セッションロック時にゃん -/
def «セッションロック» := "OnSessionLock"

/-- セッションアンロック時にゃん -/
def «セッションアンロック» := "OnSessionUnlock"

/-- バッテリー低下時にゃん -/
def «バッテリー低下» := "OnBatteryLow"

/-- バッテリー危険時にゃん -/
def «バッテリー危険» := "OnBatteryCritical"

/-- バッテリー充電開始時にゃん -/
def «バッテリー充電開始» := "OnBatteryChargingStart"

/-- バッテリー充電停止時にゃん -/
def «バッテリー充電停止» := "OnBatteryChargingStop"

/-- ディスプレイ変更時にゃん -/
def «ディスプレイ変更» := "OnDisplayChange"

/-- ディスプレイ引渡し時にゃん -/
def «ディスプレイ引渡し» := "OnDisplayHandover"

/-- ダークテーマ変更時にゃん -/
def «ダークテーマ» := "OnDarkTheme"

/-- タブレットモード変更時にゃん -/
def «タブレットモード» := "OnTabletMode"

-- ═══════════════════════════════════════════════════
--  見切れ・重なり (Superimpositio)
-- ═══════════════════════════════════════════════════

/-- 重なり検出時にゃん -/
def «重なり» := "OnOverlap"

/-- 他キャラとの重なり検出時にゃん -/
def «他重なり» := "OnOtherOverlap"

/-- 見切れ検出時にゃん -/
def «見切れ» := "OnOffscreen"

/-- 他キャラの見切れ検出時にゃん -/
def «他見切れ» := "OnOtherOffscreen"

-- ═══════════════════════════════════════════════════
--  SSTP
-- ═══════════════════════════════════════════════════

/-- SSTPスクリプト中断時にゃん -/
def «SSTP中断» := "OnSSTPBreak"

/-- SSTPブラックリスト登録時にゃん -/
def «SSTPブラックリスト» := "OnSSTPBlacklisting"

-- ═══════════════════════════════════════════════════
--  その他 (Cetera)
-- ═══════════════════════════════════════════════════

/-- ランダムトーク時にゃん（AITalk）-/
def «ランダムトーク» := "OnAITalk"

/-- 他ゴースト發言時にゃん -/
def «他ゴースト発言» := "OnOtherGhostTalk"

/-- おすすめサイト選択時にゃん -/
def «おすすめサイト選択» := "OnRecommendsiteChoice"

/-- 翻訳時にゃん -/
def «翻訳» := "OnTranslate"

/-- 音声停止時にゃん -/
def «音声停止» := "OnSoundStop"

/-- 音声ループ時にゃん -/
def «音声ループ» := "OnSoundLoop"

/-- 言語変更時にゃん -/
def «言語変更» := "OnLanguageChange"

-- ═══════════════════════════════════════════════════
--  Notify イベント
-- ═══════════════════════════════════════════════════

/-- 自己情報通知時にゃん -/
def «自己情報通知» := "OnNotifySelfInfo"

/-- バルーン情報通知時にゃん -/
def «バルーン情報通知» := "OnNotifyBalloonInfo"

/-- シェル情報通知時にゃん -/
def «シェル情報通知» := "OnNotifyShellInfo"

/-- 着せ替へ情報通知時にゃん -/
def «着せ替え情報通知» := "OnNotifyDressupInfo"

/-- ユーザ情報通知時にゃん -/
def «ユーザ情報通知» := "OnNotifyUserInfo"

/-- OS情報通知時にゃん -/
def «OS情報通知» := "OnNotifyOSInfo"

/-- フォント情報通知時にゃん -/
def «フォント情報通知» := "OnNotifyFontInfo"

end Signaculum.Protocollum.NominaEventuum
