-- Signaculum.Sakura.Textus.Responsi
-- レスポンスムヘッダー設定關數にゃん♪

import Signaculum.Sakura.Fundamentum

namespace Signaculum.Sakura.Textus

-- ════════════════════════════════════════════════════
--  レスポンスムヘッダー設定 (Configuratio Responsi)
-- ════════════════════════════════════════════════════

/-- Marker ヘッダーを設定するにゃん。バルーン下部に附加情報を表示するにゃ -/
def configuraMarker {m : Type → Type} [Monad m] (s : String) : SakuraM m Unit :=
  modify fun st => { st with marker := some s }

/-- BalloonOffset ヘッダーを設定するにゃん。バルーン位置を補正するにゃ -/
def configuraBalloonOffset {m : Type → Type} [Monad m] (x y : Int) : SakuraM m Unit :=
  modify fun st => { st with balloonOffset := some (x, y) }

/-- ErrorLevel ヘッダーを設定するにゃん。SSP のデヴェロッパーパレットで確認できるにゃ -/
def configuraErrorLevel {m : Type → Type} [Monad m] (gradus : GradusErroris) : SakuraM m Unit :=
  modify fun st => { st with errorLevel := some gradus }

/-- ErrorDescription ヘッダーを設定するにゃん。エラーの詳細を記すにゃ -/
def configuraErrorDescription {m : Type → Type} [Monad m] (s : String) : SakuraM m Unit :=
  modify fun st => { st with errorDescription := some s }

/-- ErrorLevel と ErrorDescription を一括で設定するにゃん。
    イヴェントゥム處理器内でエラーを報告したい時に使ふにゃ♪ -/
def reportaErrorem {m : Type → Type} [Monad m]
    (gradus : GradusErroris) (descriptio : String) : SakuraM m Unit :=
  modify fun st => { st with errorLevel := some gradus, errorDescription := some descriptio }

/-- 情報レヴェルのエラーを報告するにゃん -/
def reportaInformationem {m : Type → Type} [Monad m] (msg : String) : SakuraM m Unit :=
  reportaErrorem .informatio msg

/-- 通知レヴェルのエラーを報告するにゃん -/
def reportaMonitum {m : Type → Type} [Monad m] (msg : String) : SakuraM m Unit :=
  reportaErrorem .monitum msg

/-- 警告レヴェルのエラーを報告するにゃん -/
def reportaAdmonitionem {m : Type → Type} [Monad m] (msg : String) : SakuraM m Unit :=
  reportaErrorem .admonitio msg

/-- エラーレヴェルのエラーを報告するにゃん -/
def reportaError {m : Type → Type} [Monad m] (msg : String) : SakuraM m Unit :=
  reportaErrorem .error msg

/-- 致命的エラーを報告するにゃん -/
def reportaPerniciem {m : Type → Type} [Monad m] (msg : String) : SakuraM m Unit :=
  reportaErrorem .pernicies msg

/-- MarkerSend ヘッダーを設定するにゃん。SSTP 送信先へのマーカーにゃ -/
def configuraMarkerSend {m : Type → Type} [Monad m] (s : String) : SakuraM m Unit :=
  modify fun st => { st with markerSend := some s }

/-- ValueNotify ヘッダーを設定するにゃん。NOTIFY でもスクリプトゥムを實行するにゃ -/
def configuraValorNotifica {m : Type → Type} [Monad m] (s : String) : SakuraM m Unit :=
  modify fun st => { st with valorNotifica := some s }

/-- Age ヘッダーを設定するにゃん。通信世代カウンタにゃ -/
def configuraAge {m : Type → Type} [Monad m] (n : Nat) : SakuraM m Unit :=
  modify fun st => { st with age := some n }

/-- SecurityLevel ヘッダーを設定するにゃん。"local" か "external" にゃ -/
def configuraSecuritas {m : Type → Type} [Monad m] (s : String) : SakuraM m Unit :=
  modify fun st => { st with securitas := some s }

/-- ヘッダーキー名から `:` と CR/LF を除去してパケットゥム破損を防ぐにゃん -/
private def purgaClavis (s : String) : String :=
  s.foldl (fun acc c => if c != ':' && c != '\r' && c != '\n' then acc.push c else acc) ""

/-- 任意のカスタムヘッダーを追加するにゃん。X-SSTP-PassThru-* 等に使ふにゃ。
    キー名から `:` と CR/LF は自動的に除去されるにゃ -/
def addeCastellum {m : Type → Type} [Monad m] (clavis valor : String) : SakuraM m Unit :=
  modify fun st => { st with cappitta := st.cappitta ++ [(purgaClavis clavis, valor)] }

end Signaculum.Sakura.Textus
