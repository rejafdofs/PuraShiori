-- Signaculum.Sakura.Systema.Proprietatis
-- プロプリエタース・效果・着替へ關數にゃん♪

import Signaculum.Sakura.Fundamentum

namespace Signaculum.Sakura.Systema

-- ════════════════════════════════════════════════════
--  着替へ・效果 (Dressup / Effectum)
-- ════════════════════════════════════════════════════

/-- 着せ替えパーツを切り替へるにゃん（\\![bind,category,part,value]）。
    valor: `some true`=着衣(1)、`some false`=脱衣(0)、`none`=トグル（省略）にゃ -/
def nexaDressup {m : Type → Type} [Monad m]
    (categoria pars : String) (valor : Option Bool := none) : SakuraM m Unit :=
  emitte (.proprietatis (.nexaDressup categoria pars valor))

/-- 效果プラグインを適用するにゃん（\\![effect,plugin,speed,parameter]）-/
def applicaEffectum {m : Type → Type} [Monad m]
    (plugin : String) (speed : Nat) (parametrum : String) : SakuraM m Unit :=
  emitte (.proprietatis (.applicaEffectum plugin speed parametrum))

/-- フィルタを適用するにゃん（\\![filter,plugin,time,parameter]）。
    plugin を空にすると除去にゃ -/
def applicaFiltratum {m : Type → Type} [Monad m]
    (plugin : String) (tempus : Nat) (parametrum : String) : SakuraM m Unit :=
  emitte (.proprietatis (.applicaFiltratum plugin tempus parametrum))

-- ════════════════════════════════════════════════════
--  他ゴースト設定 (Configuratio Aliorum)
-- ════════════════════════════════════════════════════

/-- 他ゴーストのトーク連携を設定するにゃん（\\![set,otherghosttalk,false/before/after]）。
    `ModusGhostAlieni.inactivus/ante/post` で指定するにゃ -/
def configuraAliosGhostes {m : Type → Type} [Monad m] (modus : ModusGhostAlieni) : SakuraM m Unit :=
  emitte (.proprietatis (.configuraAliosGhostes modus))

/-- 他ゴーストの表面変更連携を設定するにゃん（\\![set,othersurfacechange,true/false]）-/
def configuraAliasSuperficies {m : Type → Type} [Monad m] (b : Bool) : SakuraM m Unit :=
  emitte (.proprietatis (.configuraAliasSuperficies b))

-- ════════════════════════════════════════════════════
--  更新・削除 (Renovatio / Evanescentia)
-- ════════════════════════════════════════════════════

/-- ゴーストをアップデートするにゃん（\\![updatebymyself,options]）-/
def renovaSeIpsum {m : Type → Type} [Monad m] (optiones : String := "") : SakuraM m Unit :=
  emitte (.proprietatis (.renovaSeIpsum optiones))

/-- ゴーストをアンインストールするにゃん（\\![vanishbymyself,options]）-/
def evanesceSeIpsum {m : Type → Type} [Monad m] (optiones : String := "") : SakuraM m Unit :=
  emitte (.proprietatis (.evanesceSeIpsum optiones))

/-- ショートカットを作成するにゃん（\\![create,shortcut]）-/
def creaViam {m : Type → Type} [Monad m] : SakuraM m Unit :=
  emitte (.proprietatis .creaViam)

/-- 副表面に效果を適用するにゃん（\\![effect2,id,plugin,speed,parameter]）-/
def applicaEffectum2 {m : Type → Type} [Monad m]
    (animId : Nat) (plugin : String) (speed : Nat) (parametrum : String) : SakuraM m Unit :=
  emitte (.proprietatis (.applicaEffectum2 animId plugin speed parametrum))

/-- タグ實行を禁止するにゃん（\\_?）-/
def inhibeTagas {m : Type → Type} [Monad m] : SakuraM m Unit :=
  emitte (.imperii .inhibeTagas)

/-- メールを確認するにゃん（\\![biff,account]）。
    account にメールアカウント名を指定するにゃ -/
def exploraPostam {m : Type → Type} [Monad m] (account : String) : SakuraM m Unit :=
  emitte (.proprietatis (.exploraPostam account))

/-- リソース参照文字列を埋め込むにゃん（\\&[ID]）。
    ID にリソース ID を指定するにゃ -/
def referentiaResourcei {m : Type → Type} [Monad m] (resourceId : String) : SakuraM m Unit :=
  emitte (.proprietatis (.referentiaResourcei resourceId))

/-- Windows メッセージを直接送るにゃん（\\m[umsg,wparam,lparam]）。
    低水準操作にゃ。umsg/wparam/lparam は 16 進數文字列にゃ -/
def nuntiumWindowae {m : Type → Type} [Monad m] (umsg wparam lparam : String) : SakuraM m Unit :=
  emitte (.proprietatis (.nuntiumWindowae umsg wparam lparam))

-- ════════════════════════════════════════════════════
--  設定システム (Systema Proprietatis)
-- ════════════════════════════════════════════════════

/-- プロパティを設定するにゃん（\\![set,property,name,value]）-/
def configuraProprietatem {m : Type → Type} [Monad m]
    (proprietas : Proprietas) (valor : String) : SakuraM m Unit :=
  emitte (.proprietatis (.configuraProprietatem proprietas valor))

/-- プロパティを取得するにゃん（\\![get,property,event,name,...]）。
    eventum に結果を受け取る事象名を渡すにゃ -/
def legeProprietatem {m : Type → Type} [Monad m]
    (eventum : String) (proprietates : List Proprietas) : SakuraM m Unit :=
  emitte (.proprietatis (.legeProprietatem eventum proprietates))

/-- プロパティ値をその場に埋め込むにゃん（%property[name]）。
    `loqui` は % をエスケープするため使へにゃい。この關數を使ふにゃ♪ -/
def proprietasCitata {m : Type → Type} [Monad m] (proprietas : Proprietas) : SakuraM m Unit :=
  emitte (.proprietatis (.proprietasCitata proprietas))

-- ════════════════════════════════════════════════════
--  同期拡張2 (Extensio Synchroniae II)
-- ════════════════════════════════════════════════════

/-- 名前付き同期オブジェクトゥムの完了を待つにゃん（\\![wait,syncobject,name,timeout]）-/
def expectaSyncObjectum {m : Type → Type} [Monad m]
    (nomen : String) (tempus : Nat) : SakuraM m Unit :=
  emitte (.proprietatis (.expectaSyncObjectum nomen tempus))

-- ════════════════════════════════════════════════════
--  ゴースト管理拡張 (Extensio Administrationis)
-- ════════════════════════════════════════════════════

/-- プラットフォームの更新を開始するにゃん（\\![update,platform]）-/
def renovaPlatformam {m : Type → Type} [Monad m] : SakuraM m Unit :=
  emitte (.proprietatis .renovaPlatformam)

/-- 指定對象の更新を實行するにゃん（\\![update,target,options]）-/
def renovaScopum {m : Type → Type} [Monad m]
    (scopus : String) (optiones : String := "") : SakuraM m Unit :=
  emitte (.proprietatis (.renovaScopum scopus optiones))

/-- 他者の更新を實行するにゃん（\\![updateother,options]）-/
def renovaAlium {m : Type → Type} [Monad m] (optiones : String) : SakuraM m Unit :=
  emitte (.proprietatis (.renovaAlium optiones))

-- ════════════════════════════════════════════════════
--  環境變數參照 (Variabiles Ambientis)
-- ════════════════════════════════════════════════════

/-- SSP が展開する環境變數をそのまま出力するにゃん（%nomen）。
    `loqui` は `%` をエスケープするため使へにゃいから、この關數を使ふにゃん♪
    例: `variabilisAmbientis "month"` → `%month` にゃ -/
def variabilisAmbientis {m : Type → Type} [Monad m] (nomen : String) : SakuraM m Unit :=
  emitte (.proprietatis (.variabilisAmbientis nomen))

end Signaculum.Sakura.Systema
