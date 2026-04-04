-- Signaculum.Notatio.Expande.Auxilium
-- 展開モジュール共通の補助函數にゃん♪
-- Textus/Fons/Systema 等の重複ヘルパーをこゝに集約するにゃ

import Lean
import Signaculum.Sakura.Scriptum
import Signaculum.Syntaxis

namespace Signaculum.Notatio.Expande

open Lean Elab Term Meta

-- ═══════════════���════════════════════════════════════
--  構文ノード值抽出 (Extractio Valorum)
-- ══════════════��═════════════════════════════════════

/-- 識別子やアトムから文字列値を取り出すにゃん -/
def extractIdentVal (s : Lean.Syntax) : Option String :=
  if s.isIdent then
    some (s.getId.toString (escape := false))
  else match s.isAtom with
  | true  => some s.getAtomVal
  | false => none

/-- 數値リテラルかどうか確認して取り出��にゃん -/
def expectaNatLit (s : Lean.Syntax) (nomenSigni : String)
    : TermElabM (Lean.TSyntax `num) := do
  match s.isNatLit? with
  | some _ => pure ⟨s⟩
  | none   =>
    let actual := match extractIdentVal s with
      | some v => s!" (實際の值: '{v}')"
      | none   => ""
    throwErrorAt s s!"{nomenSigni}: []の中には數字が期待されてゐますにゃ{actual}"

/-- 文字列リテラルかどうか確認して取り出すにゃん。
    識別子は自動で文字列リテラルに變換するにゃ -/
def expectaStrLit (s : Lean.Syntax) (nomenSigni : String)
    : TermElabM (Lean.TSyntax `str) := do
  match s.isStrLit? with
  | some _ => pure ⟨s⟩
  | none   =>
    match extractIdentVal s with
    | some v => pure ⟨Syntax.mkStrLit v⟩
    | none   => throwErrorAt s s!"{nomenSigni}: []の中には文字列が期待されてゐますにゃ"

-- ═════════════���══════════════════════════════���═══════
--  コールバック解決 (Resolutio Callbacki)
-- ═════��══════════════════════════��═══════════════════

/-- cb からイヴェント名 term とパラメータ型配列を作るにゃん♪
    strLit → そのまま（型情報なし）、ident → registraLazium（型取得）、
    項 → elaborate して型取得 → registraLaziumLambda。
    選擇肢 (\\q, \_a) でも事象 (\\![raise,...]) でも共通で使ふにゃ -/
def resolveCallbackum (cb : Syntax) (paramCount : Nat := 0)
    : TermElabM CallbackumResolutum := do
  if cb.isStrLit?.isSome then
    let stx : TSyntax `term := ⟨cb⟩
    return .staticum stx #[]
  else if cb.isIdent then
    match ← Signaculum.resolveToConstOpt ⟨cb⟩ with
    | some fname =>
      let ev ← Signaculum.registraLazium ⟨cb⟩
      let some info := (← getEnv).find? fname |
        throwError "resolveCallbackum: {cb} が見つからにゃいにゃ"
      let paramTypes ← Signaculum.getExplicitParamTypes info.type
      -- ホバー: コールバック識別子の型を表示するにゃん♪
      let expr ← mkConstWithLevelParams fname
      Term.addTermInfo' cb expr (isBinder := false)
      return .staticum (← `($(Syntax.mkStrLit ev))) paramTypes
    | none =>
      -- ローカル變數: elaborate して型情報を登錄するにゃん
      let cbExpr ← elabTerm cb none
      Term.addTermInfo' cb cbExpr (isBinder := false)
      return .dynamicum (← Signaculum.generaCallbackumDynamicum ⟨cb⟩ paramCount)
  else
    let cbExpr ← elabTerm cb none
    let cbType ← inferType cbExpr
    let paramTypes ← Signaculum.getExplicitParamTypes (← whnf cbType)
    if paramTypes.size == paramCount then
      let posIdx := (cb.getPos?.getD ⟨0⟩).byteIdx
      let ev ← Signaculum.registraLaziumLambda cb posIdx paramCount
      return .staticum (← `($(Syntax.mkStrLit ev))) paramTypes
    else
      return .dynamicum (← Signaculum.generaCallbackumDynamicum ⟨cb⟩ paramCount)

end Signaculum.Notatio.Expande
