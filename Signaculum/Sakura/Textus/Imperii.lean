-- Signaculum.Sakura.Textus.Imperii
-- 制御命令關數にゃん♪

import Signaculum.Sakura.Fundamentum

namespace Signaculum.Sakura.Textus

-- ════════════════════════════════════════════════════
--  制御 (Imperium)
-- ════════════════════════════════════════════════════

/-- スクリプト終了（\\e）にゃん。全ての SakuraScript の末尾に必ず置くにゃ -/
def finis {m : Type → Type} [Monad m] : SakuraM m Unit := emitte (.imperii .finis)

/-- 即時表示切替（\\_q）にゃん -/
def celer {m : Type → Type} [Monad m] : SakuraM m Unit := emitte (.imperii .celer)

/-- ゴースト退出（\\-）にゃん -/
def exitus {m : Type → Type} [Monad m] : SakuraM m Unit := emitte (.imperii .exitus)

/-- 同期區劃切替（\\_s）にゃん -/
def synchrona {m : Type → Type} [Monad m] : SakuraM m Unit := emitte (.imperii .synchrona)

/-- 隨機ゴースト切替（\\+）にゃん -/
def mutaGhost {m : Type → Type} [Monad m] : SakuraM m Unit := emitte (.imperii .mutaGhost)

end Signaculum.Sakura.Textus
