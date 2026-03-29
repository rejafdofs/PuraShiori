-- Signaculum.Sakura.Systema.Mutationis
-- ゴースト・シェル・吹出し變更・再讀込關數にゃん♪

import Signaculum.Sakura.Fundamentum

namespace Signaculum.Sakura.Systema

-- ════════════════════════════════════════════════════
--  変更 (Mutatio) — ゴースト/シェル/吹出し変更
-- ════════════════════════════════════════════════════

/-- ゴーストを名前で切り替へるにゃん（\\![change,ghost,name,options]）。
    nomen にゴーストのディレクトリ名、optiones で raise-event を指定できるにゃ -/
def mutaGhostNomen {m : Type → Type} [Monad m]
    (nomen : String) (optiones : OptionesMutationis := {}) : SakuraM m Unit :=
  emitte (.mutationis (.mutaGhostNomen nomen optiones))

/-- シェルを名前で切り替へるにゃん（\\![change,shell,name,options]）。
    nomen にシェル名、optiones で raise-event を指定できるにゃ -/
def mutaShell {m : Type → Type} [Monad m]
    (nomen : String) (optiones : OptionesMutationis := {}) : SakuraM m Unit :=
  emitte (.mutationis (.mutaShell nomen optiones))

/-- 吹出しを名前で切り替へるにゃん（\\![change,balloon,name,options]）。
    nomen に吹出し名、optiones で raise-event を指定できるにゃ -/
def mutaBullam {m : Type → Type} [Monad m]
    (nomen : String) (optiones : OptionesMutationis := {}) : SakuraM m Unit :=
  emitte (.mutationis (.mutaBullam nomen optiones))

/-- ゴーストを再起動するにゃん（\\![reboot]）。
    SAKURA スクリプトを完全にリロードするにゃ♪ -/
def renovaGhost {m : Type → Type} [Monad m] : SakuraM m Unit :=
  emitte (.mutationis .renovaGhost)

-- ════════════════════════════════════════════════════
--  再讀込 (Renovatio)
-- ════════════════════════════════════════════════════

/-- 表面を再讀込するにゃん（\\![reloadsurface]）-/
def renovaSuperficiem {m : Type → Type} [Monad m] : SakuraM m Unit :=
  emitte (.mutationis .renovaSuperficiem)

/-- `ScopusRenovationis` で指定された對象を再讀込するにゃん（\\![reload,X]）。
    ※ ゴースト全體の再起動は `renovaGhost`（\\![reboot]）で別にゃん -/
def renova {m : Type → Type} [Monad m] (scopus : ScopusRenovationis) : SakuraM m Unit :=
  emitte (.mutationis (.renova scopus))

-- ════════════════════════════════════════════════════
--  再讀込拡張 (Extensio Renovationis)
-- ════════════════════════════════════════════════════

/-- SHIORI をアンロードするにゃん（\\![unload,shiori]）-/
def expelleShiori {m : Type → Type} [Monad m] : SakuraM m Unit :=
  emitte (.mutationis .expelleShiori)

/-- makoto をアンロードするにゃん（\\![unload,makoto]）-/
def expelleMakoto {m : Type → Type} [Monad m] : SakuraM m Unit :=
  emitte (.mutationis .expelleMakoto)

/-- SHIORI をロードするにゃん（\\![load,shiori]）-/
def oneraSHIORI {m : Type → Type} [Monad m] : SakuraM m Unit :=
  emitte (.mutationis .oneraSHIORI)

/-- makoto をロードするにゃん（\\![load,makoto]）-/
def oneraMakoto {m : Type → Type} [Monad m] : SakuraM m Unit :=
  emitte (.mutationis .oneraMakoto)

/-- SHIORI のデバッグモードを設定するにゃん（\\![set,shioridebugmode]）-/
def configuraShioriDebug {m : Type → Type} [Monad m] : SakuraM m Unit :=
  emitte (.mutationis .configuraShioriDebug)

end Signaculum.Sakura.Systema
