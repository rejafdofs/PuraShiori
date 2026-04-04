-- Signaculum.Notatio.Expande.Systema.Rete
-- HTTP・ネットワーク・實行系タグのディスパッチにゃん♪
-- execute 系サブコマンドを扱ふにゃ

import Lean
import Signaculum.Sakura.Scriptum
import Signaculum.Notatio.Expande.Auxilium

namespace Signaculum.Notatio.Expande.Systema

open Lean Elab Term
open Signaculum.Notatio.Expande (extractIdentVal expectaStrLit)

-- ════════════════════════════════════════════════════
--  execute サブコマンドディスパッチ (Dispatch Executionis)
-- ════════════════════════════════════════════════════

/-- `\![execute,...]` のサブコマンドを展開するにゃん♪
    `args[0]` がサブコマンド名（"http-get" 等）、殘りが引數にゃ -/
def expandeExecutio (args : Array Lean.Syntax) (stx : Lean.Syntax)
    : TermElabM (Option (TSyntax `term)) := do
  if args.size < 1 then
    throwErrorAt stx "\\![execute,...]: サブコマンドが必要にゃ"
  let sub := match extractIdentVal args[0]! with
    | some v => v
    | none   => ""
  match sub with

  -- ────────────────────────────────────────────────
  --  HTTP メソッドにゃん
  -- ────────────────────────────────────────────────

  | "http-get" =>
    if args.size < 2 then
      throwErrorAt stx "\\![execute,http-get,...]: URL が必要にゃ"
    let u ← expectaStrLit args[1]! "\\![execute,http-get]"
    pure <| some (← `(Signaculum.Sakura.Systema.executaHttpGet $u))

  | "http-post" =>
    if args.size < 2 then
      throwErrorAt stx "\\![execute,http-post,...]: URL が必要にゃ"
    let u ← expectaStrLit args[1]! "\\![execute,http-post]"
    pure <| some (← `(Signaculum.Sakura.Systema.executaHttpPost $u))

  | "http-head" =>
    if args.size < 2 then
      throwErrorAt stx "\\![execute,http-head,...]: URL が必要にゃ"
    let u ← expectaStrLit args[1]! "\\![execute,http-head]"
    pure <| some (← `(Signaculum.Sakura.Systema.executaHttpHead $u))

  | "http-put" =>
    if args.size < 2 then
      throwErrorAt stx "\\![execute,http-put,...]: URL が必要にゃ"
    let u ← expectaStrLit args[1]! "\\![execute,http-put]"
    pure <| some (← `(Signaculum.Sakura.Systema.executaHttpPut $u))

  | "http-delete" =>
    if args.size < 2 then
      throwErrorAt stx "\\![execute,http-delete,...]: URL が必要にゃ"
    let u ← expectaStrLit args[1]! "\\![execute,http-delete]"
    pure <| some (← `(Signaculum.Sakura.Systema.executaHttpDelete $u))

  | "http-patch" =>
    if args.size < 2 then
      throwErrorAt stx "\\![execute,http-patch,...]: URL が必要にゃ"
    let u ← expectaStrLit args[1]! "\\![execute,http-patch]"
    pure <| some (← `(Signaculum.Sakura.Systema.executaHttpPatch $u))

  | "http-options" =>
    if args.size < 2 then
      throwErrorAt stx "\\![execute,http-options,...]: URL が必要にゃ"
    let u ← expectaStrLit args[1]! "\\![execute,http-options]"
    pure <| some (← `(Signaculum.Sakura.Systema.executaHttpOptions $u))

  -- ────────────────────────────────────────────────
  --  RSS にゃん
  -- ────────────────────────────────────────────────

  | "rss-get" =>
    if args.size < 2 then
      throwErrorAt stx "\\![execute,rss-get,...]: URL が必要にゃ"
    let u ← expectaStrLit args[1]! "\\![execute,rss-get]"
    pure <| some (← `(Signaculum.Sakura.Systema.executaRssGet $u))

  | "rss-post" =>
    if args.size < 2 then
      throwErrorAt stx "\\![execute,rss-post,...]: URL が必要にゃ"
    let u ← expectaStrLit args[1]! "\\![execute,rss-post]"
    pure <| some (← `(Signaculum.Sakura.Systema.executaRssPost $u))

  -- ────────────────────────────────────────────────
  --  ヘッドライン・DNS・PING にゃん
  -- ────────────────────────────────────────────────

  | "headline" =>
    if args.size < 2 then
      throwErrorAt stx "\\![execute,headline,...]: 名前が必要にゃ"
    let n ← expectaStrLit args[1]! "\\![execute,headline]"
    pure <| some (← `(Signaculum.Sakura.Systema.executaHeadline $n))

  | "nslookup" =>
    if args.size < 2 then
      throwErrorAt stx "\\![execute,nslookup,...]: パラメータが必要にゃ"
    let p ← expectaStrLit args[1]! "\\![execute,nslookup]"
    pure <| some (← `(Signaculum.Sakura.Systema.executaNslookup [$p]))

  | "ping" =>
    if args.size < 2 then
      throwErrorAt stx "\\![execute,ping,...]: パラメータが必要にゃ"
    let p ← expectaStrLit args[1]! "\\![execute,ping]"
    pure <| some (← `(Signaculum.Sakura.Systema.executaPing [$p]))

  -- ────────────────────────────────────────────────
  --  ダンプ・インストール・作成にゃん
  -- ────────────────────────────────────────────────

  | "dumpsurface" =>
    if args.size < 7 then
      throwErrorAt stx "\\![execute,dumpsurface,...]: dir, scope, list, prefix, event, zero の6引數が必要にゃ"
    let d ← expectaStrLit args[1]! "\\![execute,dumpsurface]"
    let s : TSyntax `term := ⟨args[2]!⟩
    let l ← expectaStrLit args[3]! "\\![execute,dumpsurface]"
    let p ← expectaStrLit args[4]! "\\![execute,dumpsurface]"
    let e ← expectaStrLit args[5]! "\\![execute,dumpsurface]"
    let z : TSyntax `term := ⟨args[6]!⟩
    pure <| some (← `(Signaculum.Sakura.Systema.executaDumpSuperficiei $d $s $l $p $e $z))

  | "install" =>
    -- install の後にさらにサブコマンドがあるにゃん
    if args.size < 2 then
      throwErrorAt stx "\\![execute,install,...]: サブコマンドが必要にゃ"
    let installSub := match extractIdentVal args[1]! with
      | some v => v
      | none   => ""
    match installSub with
    | "url" =>
      if args.size < 4 then
        throwErrorAt stx "\\![execute,install,url,...]: URL, type の2引數が必要にゃ"
      let u ← expectaStrLit args[2]! "\\![execute,install,url]"
      let t ← expectaStrLit args[3]! "\\![execute,install,url]"
      pure <| some (← `(Signaculum.Sakura.Systema.executaInstallationemUrl $u $t))
    | "path" =>
      if args.size < 3 then
        throwErrorAt stx "\\![execute,install,path,...]: パスが必要にゃ"
      let v ← expectaStrLit args[2]! "\\![execute,install,path]"
      pure <| some (← `(Signaculum.Sakura.Systema.executaInstallationemVia $v))
    | other =>
      throwErrorAt stx s!"\\![execute,install,{other},...]: 未知のサブコマンドにゃ"

  | "createupdatedata" =>
    pure <| some (← `(Signaculum.Sakura.Systema.executaCreationemUpdateData))

  | "createnar" =>
    pure <| some (← `(Signaculum.Sakura.Systema.executaCreationemNar))

  | "emptyrecyclebin" =>
    pure <| some (← `(Signaculum.Sakura.Systema.evacuaRecyclatorium))

  | other =>
    throwErrorAt stx s!"\\![execute,{other},...]: 未知のサブコマンドにゃ"

end Signaculum.Notatio.Expande.Systema
