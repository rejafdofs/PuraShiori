-- Signaculum.Notatio.Systema
-- イヴェントゥム・音響・動畫・呼出・實行・變更の構文規則にゃん♪

import Signaculum.Notatio.Categoria
import Signaculum.Sakura.Scriptum

namespace Signaculum.Notatio

open Lean Signaculum.Sakura

-- 事象にゃん
-- Syntax には getAppFn/getAppArgs がないため node パターンで手動分解にゃん
private partial def decompAppSyntax : Syntax → Syntax × Array Syntax
  | .node _ `Lean.Parser.Term.app #[hd, tl] =>
    let (f, prevArgs) := decompAppSyntax hd
    (f, prevArgs.push tl)
  | s => (s, #[])

-- macro_rules のハイジーン機構を避けるため mkIdent で識別子を直接生成するにゃん
private def toRefIdTerm : TSyntax `term :=
  ⟨(mkIdent `Signaculum.Memoria.Citatio.toRef).raw⟩

syntax "\\!" "[raise," term "]" : sakuraSignum
macro_rules
| `(expandSignum \![raise, $e:str]) => `(Signaculum.Sakura.excita $e)
| `(expandSignum \![raise, $app:term]) => do
  let (hd, appArgs) := decompAppSyntax app.raw
  let nameStr := Lean.Syntax.mkStrLit hd.getId.toString
  let toRef := toRefIdTerm
  let wrappedArgs : Array (TSyntax `term) ← appArgs.mapM fun a => do
    let t : TSyntax `term := ⟨a⟩
    `($toRef $t)
  `(Signaculum.Sakura.excita $nameStr [$wrappedArgs,*])

syntax "\\!" "[embed," term "]" : sakuraSignum
macro_rules
| `(expandSignum \![embed, $e:str]) => `(Signaculum.Sakura.insere $e)
| `(expandSignum \![embed, $app:term]) => do
  let (hd, appArgs) := decompAppSyntax app.raw
  let nameStr := Lean.Syntax.mkStrLit hd.getId.toString
  let toRef := toRefIdTerm
  let wrappedArgs : Array (TSyntax `term) ← appArgs.mapM fun a => do
    let t : TSyntax `term := ⟨a⟩
    `($toRef $t)
  `(Signaculum.Sakura.insere $nameStr [$wrappedArgs,*])

syntax "\\!" "[notify," term "]" : sakuraSignum
macro_rules
| `(expandSignum \![notify, $e:str]) => `(Signaculum.Sakura.notifica $e)
| `(expandSignum \![notify, $app:term]) => do
  let (hd, appArgs) := decompAppSyntax app.raw
  let nameStr := Lean.Syntax.mkStrLit hd.getId.toString
  let toRef := toRefIdTerm
  let wrappedArgs : Array (TSyntax `term) ← appArgs.mapM fun a => do
    let t : TSyntax `term := ⟨a⟩
    `($toRef $t)
  `(Signaculum.Sakura.notifica $nameStr [$wrappedArgs,*])

-- タイマーにゃん
syntax "\\!" "[timerraise," term "," term "," term "]" : sakuraSignum
macro_rules
| `(expandSignum \![timerraise, $ms, $rep, $e:str]) => `(Signaculum.Sakura.excitaPostTempus $ms $rep $e)
| `(expandSignum \![timerraise, $ms, $rep, $app:term]) => do
  let (hd, appArgs) := decompAppSyntax app.raw
  let nameStr := Lean.Syntax.mkStrLit hd.getId.toString
  let toRef := toRefIdTerm
  let wrappedArgs : Array (TSyntax `term) ← appArgs.mapM fun a => do
    let t : TSyntax `term := ⟨a⟩
    `($toRef $t)
  `(Signaculum.Sakura.excitaPostTempus $ms $rep $nameStr [$wrappedArgs,*])

syntax "\\!" "[timernotify," term "," term "," term "]" : sakuraSignum
macro_rules
| `(expandSignum \![timernotify, $ms, $rep, $e:str]) => `(Signaculum.Sakura.notificaPostTempus $ms $rep $e)
| `(expandSignum \![timernotify, $ms, $rep, $app:term]) => do
  let (hd, appArgs) := decompAppSyntax app.raw
  let nameStr := Lean.Syntax.mkStrLit hd.getId.toString
  let toRef := toRefIdTerm
  let wrappedArgs : Array (TSyntax `term) ← appArgs.mapM fun a => do
    let t : TSyntax `term := ⟨a⟩
    `($toRef $t)
  `(Signaculum.Sakura.notificaPostTempus $ms $rep $nameStr [$wrappedArgs,*])



-- 音響にゃん
syntax "\\_v" "[" str "]" : sakuraSignum
macro_rules | `(expandSignum \_v[$s]) => `(Signaculum.Sakura.sonus $s)

syntax "\\8" "[" str "]" : sakuraSignum
macro_rules | `(expandSignum \8[$s]) => `(Signaculum.Sakura.sonus8 $s)

syntax "\\!" "[sound,play," str "]" : sakuraSignum
macro_rules | `(expandSignum \![sound,play, $s]) => `(Signaculum.Sakura.sonusPulsus $s)

syntax "\\!" "[sound,loop," str "]" : sakuraSignum
macro_rules | `(expandSignum \![sound,loop, $s]) => `(Signaculum.Sakura.sonusOrbitans $s)

syntax "\\!" "[sound,stop," str "]" : sakuraSignum
macro_rules | `(expandSignum \![sound,stop, $s]) => `(Signaculum.Sakura.sonusInterrumpit $s)

syntax "\\!" "[sound,pause," str "]" : sakuraSignum
macro_rules | `(expandSignum \![sound,pause, $s]) => `(Signaculum.Sakura.sonusPausat $s)

syntax "\\!" "[sound,resume," str "]" : sakuraSignum
macro_rules | `(expandSignum \![sound,resume, $s]) => `(Signaculum.Sakura.sonusContinuat $s)

syntax "\\!" "[sound,wait]" : sakuraSignum
macro_rules | `(expandSignum \![sound,wait]) => `(Signaculum.Sakura.expectaSonumPulsus)

-- 動畫にゃん
syntax "\\!" "[anim,start," term "," term "]" : sakuraSignum
macro_rules | `(expandSignum \![anim,start, $s, $i]) => `(Signaculum.Sakura.animaIncepit $s $i)

syntax "\\!" "[anim,stop," term "," term "]" : sakuraSignum
macro_rules | `(expandSignum \![anim,stop, $s, $i]) => `(Signaculum.Sakura.animaDesinit $s $i)

syntax "\\!" "[anim,pause," term "," term "]" : sakuraSignum
macro_rules | `(expandSignum \![anim,pause, $s, $i]) => `(Signaculum.Sakura.animaPausat $s $i)

syntax "\\!" "[anim,resume," term "," term "]" : sakuraSignum
macro_rules | `(expandSignum \![anim,resume, $s, $i]) => `(Signaculum.Sakura.animaContinuat $s $i)

syntax "\\!" "[anim,clear," term "," term "]" : sakuraSignum
macro_rules | `(expandSignum \![anim,clear, $s, $i]) => `(Signaculum.Sakura.animaPurgat $s $i)

-- 非同期起動にゃん（term 丸ごと渡すにゃん）
syntax "\\!" "[async," term "]" : sakuraSignum
macro_rules
| `(expandSignum \![async, $app:term]) => do
  `(liftM (Signaculum.spawnaMunitus do
      let _s ← Signaculum.Sakura.currere $app
      Signaculum.Sstp.mitteSstpScriptum _s))

-- 呼出にゃん
syntax "\\!" "[call,shiori," str "]" : sakuraSignum
macro_rules | `(expandSignum \![call,shiori, $e]) => `(Signaculum.Sakura.vocaShiori $e)

syntax "\\!" "[call,saori," str "," str "]" : sakuraSignum
macro_rules | `(expandSignum \![call,saori, $d, $f]) => `(Signaculum.Sakura.vocaSaori $d $f)

-- 変更にゃん
syntax "\\!" "[change,ghost," str "]" : sakuraSignum
macro_rules | `(expandSignum \![change,ghost, $n]) => `(Signaculum.Sakura.mutaGhostNomen $n)

syntax "\\!" "[change,shell," str "]" : sakuraSignum
macro_rules | `(expandSignum \![change,shell, $n]) => `(Signaculum.Sakura.mutaShell $n)

syntax "\\!" "[change,balloon," str "]" : sakuraSignum
macro_rules | `(expandSignum \![change,balloon, $n]) => `(Signaculum.Sakura.mutaBullam $n)

-- 更新にゃん
syntax "\\!" "[updatebymyself]" : sakuraSignum
macro_rules | `(expandSignum \![updatebymyself]) => `(Signaculum.Sakura.renovaSeIpsum)

syntax "\\!" "[vanishbymyself]" : sakuraSignum
macro_rules | `(expandSignum \![vanishbymyself]) => `(Signaculum.Sakura.evanesceSeIpsum)

syntax "\\!" "[executesntp]" : sakuraSignum
macro_rules | `(expandSignum \![executesntp]) => `(Signaculum.Sakura.executaSNTP)

syntax "\\!" "[reloadsurface]" : sakuraSignum
macro_rules | `(expandSignum \![reloadsurface]) => `(Signaculum.Sakura.renovaSuperficiem)

syntax "\\!" "[reload," term "]" : sakuraSignum
macro_rules | `(expandSignum \![reload, $s]) => `(Signaculum.Sakura.renova $s)

-- 荷卸にゃん
syntax "\\!" "[unload,shiori]" : sakuraSignum
macro_rules | `(expandSignum \![unload,shiori]) => `(Signaculum.Sakura.expelleShiori)

syntax "\\!" "[load,shiori]" : sakuraSignum
macro_rules | `(expandSignum \![load,shiori]) => `(Signaculum.Sakura.oneraSHIORI)

syntax "\\!" "[unload,makoto]" : sakuraSignum
macro_rules | `(expandSignum \![unload,makoto]) => `(Signaculum.Sakura.expelleMakoto)

syntax "\\!" "[load,makoto]" : sakuraSignum
macro_rules | `(expandSignum \![load,makoto]) => `(Signaculum.Sakura.oneraMakoto)

-- 着替・效果にゃん
syntax "\\!" "[bind," str "," str "," str "]" : sakuraSignum
macro_rules | `(expandSignum \![bind, $c, $p, $v]) => `(Signaculum.Sakura.nexaDressup $c $p $v)

syntax "\\!" "[effect," str "," term "," str "]" : sakuraSignum
macro_rules | `(expandSignum \![effect, $p, $s, $r]) => `(Signaculum.Sakura.applicaEffectum $p $s $r)

-- 郵便にゃん
syntax "\\!" "[biff," str "]" : sakuraSignum
macro_rules | `(expandSignum \![biff, $a]) => `(Signaculum.Sakura.exploraPostam $a)

-- 設定システムにゃん
syntax "\\!" "[set,property," term "," str "]" : sakuraSignum
macro_rules | `(expandSignum \![set,property, $p, $v]) => `(Signaculum.Sakura.configuraProprietatem $p $v)

end Signaculum.Notatio
