-- Signaculum.Sakura.Systema.Retis
-- HTTP・ネットワーク・ファスキクルス操作關數にゃん♪

import Signaculum.Sakura.Fundamentum

namespace Signaculum.Sakura.Systema

-- ════════════════════════════════════════════════════
--  HTTP 拡張 (Extensio HTTP)
-- ════════════════════════════════════════════════════

/-- HTTP GET リクエストゥムを實行するにゃん（\\![execute,http-get,URL,options]）-/
def executaHttpGet {m : Type → Type} [Monad m]
    (nexus : String) (optiones : String := "") : SakuraM m Unit :=
  emitte (.retis (.executaHttpGet nexus optiones))

/-- HTTP POST リクエストゥムを實行するにゃん（\\![execute,http-post,URL,options]）-/
def executaHttpPost {m : Type → Type} [Monad m]
    (nexus : String) (optiones : String := "") : SakuraM m Unit :=
  emitte (.retis (.executaHttpPost nexus optiones))

/-- HTTP HEAD リクエストゥムを實行するにゃん（\\![execute,http-head,URL,options]）-/
def executaHttpHead {m : Type → Type} [Monad m]
    (nexus : String) (optiones : String := "") : SakuraM m Unit :=
  emitte (.retis (.executaHttpHead nexus optiones))

/-- HTTP PUT リクエストを實行するにゃん（\\![execute,http-put,URL,options]）-/
def executaHttpPut {m : Type → Type} [Monad m]
    (nexus : String) (optiones : String := "") : SakuraM m Unit :=
  emitte (.retis (.executaHttpPut nexus optiones))

/-- HTTP DELETE リクエストを實行するにゃん（\\![execute,http-delete,URL,options]）-/
def executaHttpDelete {m : Type → Type} [Monad m]
    (nexus : String) (optiones : String := "") : SakuraM m Unit :=
  emitte (.retis (.executaHttpDelete nexus optiones))

/-- HTTP PATCH リクエストを實行するにゃん（\\![execute,http-patch,URL,options]）-/
def executaHttpPatch {m : Type → Type} [Monad m]
    (nexus : String) (optiones : String := "") : SakuraM m Unit :=
  emitte (.retis (.executaHttpPatch nexus optiones))

/-- RSS GET リクエストを實行するにゃん（\\![execute,rss-get,URL,options]）-/
def executaRssGet {m : Type → Type} [Monad m]
    (nexus : String) (optiones : String := "") : SakuraM m Unit :=
  emitte (.retis (.executaRssGet nexus optiones))

/-- ヘッドラインを實行するにゃん（\\![execute,headline,name]）-/
def executaHeadline {m : Type → Type} [Monad m] (nomen : String) : SakuraM m Unit :=
  emitte (.retis (.executaHeadline nomen))

/-- DNS 解決を實行するにゃん（\\![execute,nslookup,param,...]）-/
def executaNslookup {m : Type → Type} [Monad m] (parametra : List String) : SakuraM m Unit :=
  emitte (.retis (.executaNslookup parametra))

/-- PING を實行するにゃん（\\![execute,ping,param,...]）-/
def executaPing {m : Type → Type} [Monad m] (parametra : List String) : SakuraM m Unit :=
  emitte (.retis (.executaPing parametra))

/-- SNTP 時刻同期を實行するにゃん（\\![executesntp]）-/
def executaSNTP {m : Type → Type} [Monad m] : SakuraM m Unit :=
  emitte (.retis .executaSNTP)

/-- 表面をダンプするにゃん（\\![execute,dumpsurface,dir,scope,list,prefix,event,zero]）-/
def executaDumpSuperficiei {m : Type → Type} [Monad m]
    (directum : String) (scopus : Nat) (lista praefixum eventum : String) (zero : Bool) : SakuraM m Unit :=
  emitte (.retis (.executaDumpSuperficiei directum scopus lista praefixum eventum zero))

/-- URL からゴーストをインストールするにゃん（\\![execute,install,url,URL,type]）-/
def executaInstallationemUrl {m : Type → Type} [Monad m]
    (nexus typus : String) : SakuraM m Unit :=
  emitte (.retis (.executaInstallationemUrl nexus typus))

/-- 更新データを作成するにゃん（\\![execute,createupdatedata]）-/
def executaCreationemUpdateData {m : Type → Type} [Monad m] : SakuraM m Unit :=
  emitte (.retis .executaCreationemUpdateData)

-- ════════════════════════════════════════════════════
--  ファイル操作 (Operationes Fasciculorum)
-- ════════════════════════════════════════════════════

/-- アーカイブを展開するにゃん（\\![execute,extractarchive,file,folder,options]）-/
def extraheArchivum {m : Type → Type} [Monad m]
    (via directum : String) (optiones : String := "") : SakuraM m Unit :=
  emitte (.retis (.extraheArchivum via directum optiones))

/-- フォルダを壓縮するにゃん（\\![execute,compressarchive,file,folder,options]）-/
def comprimeArchivum {m : Type → Type} [Monad m]
    (via directum : String) (optiones : String := "") : SakuraM m Unit :=
  emitte (.retis (.comprimeArchivum via directum optiones))

/-- ファイルからインストールするにゃん（\\![execute,install,path,file]）-/
def executaInstallationemVia {m : Type → Type} [Monad m] (via : String) : SakuraM m Unit :=
  emitte (.retis (.executaInstallationemVia via))

/-- NAR ファイルを作成するにゃん（\\![execute,createnar]）-/
def executaCreationemNar {m : Type → Type} [Monad m] : SakuraM m Unit :=
  emitte (.retis .executaCreationemNar)

/-- ゴミ箱を空にするにゃん（\\![execute,emptyrecyclebin]）-/
def evacuaRecyclatorium {m : Type → Type} [Monad m] : SakuraM m Unit :=
  emitte (.retis .evacuaRecyclatorium)

-- ════════════════════════════════════════════════════
--  HTTP 拡張2 (Extensio HTTP II)
-- ════════════════════════════════════════════════════

/-- HTTP OPTIONS リクエストゥムを實行するにゃん（\\![execute,http-options,URL,options]）-/
def executaHttpOptions {m : Type → Type} [Monad m]
    (nexus : String) (optiones : String := "") : SakuraM m Unit :=
  emitte (.retis (.executaHttpOptions nexus optiones))

/-- RSS POST リクエストゥムを實行するにゃん（\\![execute,rss-post,URL,options]）-/
def executaRssPost {m : Type → Type} [Monad m]
    (nexus : String) (optiones : String := "") : SakuraM m Unit :=
  emitte (.retis (.executaRssPost nexus optiones))

end Signaculum.Sakura.Systema
