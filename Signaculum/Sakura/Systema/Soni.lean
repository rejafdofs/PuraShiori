-- Signaculum.Sakura.Systema.Soni
-- 音響關數にゃん♪

import Signaculum.Sakura.Fundamentum

namespace Signaculum.Sakura.Systema

-- ════════════════════════════════════════════════════
--  音聲 (Sonus)
-- ════════════════════════════════════════════════════

/-- 音聲を再生する（\\_v[file]）にゃん -/
def sonus {m : Type → Type} [Monad m] (via : String) : SakuraM m Unit :=
  emitte (.soni (.sonus via))

/-- 音聲の終了を待つ（\\_V）にゃん -/
def expectaSonum {m : Type → Type} [Monad m] : SakuraM m Unit :=
  emitte (.soni .expectaSonum)

-- ════════════════════════════════════════════════════
--  音響拡張 (Extensio Soni)
-- ════════════════════════════════════════════════════

/-- 波形ファイルを簡易再生するにゃん（\\8[filename]）-/
def sonus8 {m : Type → Type} [Monad m] (via : String) : SakuraM m Unit :=
  emitte (.soni (.sonus8 via))

/-- 音聲ファイルを再生するにゃん（\\![sound,play,file,options]）。
    optiones は `OptionesSoni` で指定するにゃ -/
def sonusPulsus {m : Type → Type} [Monad m]
    (via : String) (optiones : OptionesSoni := {}) : SakuraM m Unit :=
  emitte (.soni (.sonusPulsus via optiones))

/-- 音聲ファイルをループ再生するにゃん（\\![sound,loop,file]）-/
def sonusOrbitans {m : Type → Type} [Monad m] (via : String) : SakuraM m Unit :=
  emitte (.soni (.sonusOrbitans via))

/-- 音聲ファイルを停止するにゃん（\\![sound,stop,file]）-/
def sonusInterrumpit {m : Type → Type} [Monad m] (via : String) : SakuraM m Unit :=
  emitte (.soni (.sonusInterrumpit via))

/-- 音聲ファイルを一時停止するにゃん（\\![sound,pause,file]）-/
def sonusPausat {m : Type → Type} [Monad m] (via : String) : SakuraM m Unit :=
  emitte (.soni (.sonusPausat via))

/-- 音聲ファイルを再開するにゃん（\\![sound,resume,file]）-/
def sonusContinuat {m : Type → Type} [Monad m] (via : String) : SakuraM m Unit :=
  emitte (.soni (.sonusContinuat via))

/-- 音聲ファイルを事前讀込みするにゃん（\\![sound,load,file,options]）。
    optiones は `OptionesSoni` で指定するにゃ。`solusAudio` も使へるにゃ -/
def sonusOneratur {m : Type → Type} [Monad m]
    (via : String) (optiones : OptionesSoni := {}) : SakuraM m Unit :=
  emitte (.soni (.sonusOneratur via optiones))

-- ════════════════════════════════════════════════════
--  音響拡張2 (Extensio Soni II)
-- ════════════════════════════════════════════════════

/-- 音聲の完了を待つにゃん（\\![sound,wait]）-/
def expectaSonumPulsus {m : Type → Type} [Monad m] : SakuraM m Unit :=
  emitte (.soni .expectaSonumPulsus)

/-- CD トラックを再生するにゃん（\\![sound,cdplay,track]）-/
def sonusCD {m : Type → Type} [Monad m] (track : Nat) : SakuraM m Unit :=
  emitte (.soni (.sonusCD track))

/-- 音聲のオプションを変更するにゃん（\\![sound,option,file,options]）。
    optiones は `OptionesSoni` で指定するにゃ -/
def sonusOptio {m : Type → Type} [Monad m]
    (via : String) (optiones : OptionesSoni) : SakuraM m Unit :=
  emitte (.soni (.sonusOptio via optiones))

-- ════════════════════════════════════════════════════
--  音聲合成 (Synthesis Vocis)
-- ════════════════════════════════════════════════════

/-- 音聲合成の發聲を調整するにゃん（\\__v[options]）-/
def synthesisVocis {m : Type → Type} [Monad m] (optiones : String) : SakuraM m Unit :=
  emitte (.soni (.synthesisVocis optiones))

end Signaculum.Sakura.Systema
