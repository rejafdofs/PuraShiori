-- Signaculum.Notatio.Systema
-- イヴェントゥム・音響・動畫・呼出・實行・變更の構文規則にゃん♪

import Signaculum.Notatio.Categoria
import Signaculum.Sakura.Scriptum

namespace Signaculum.Notatio

open Lean Signaculum.Sakura

-- 事象にゃん
syntax "\\!" "[raise," str "]" : sakuraSignum
macro_rules | `(expandSignum \![raise, $e]) => `(Signaculum.Sakura.excita $e)

-- ident + term*（引數なし・あり共通）にゃ
syntax "\\!" "[raise," ident term* "]" : sakuraSignum
macro_rules
| `(expandSignum \![raise, $f:ident $args:term*]) => do
  let nameStr := Lean.Syntax.mkStrLit f.getId.toString
  let wrappedArgs ← args.mapM fun a => `(Signaculum.Memoria.Citatio.toRef $a)
  `(Signaculum.Sakura.excita $nameStr [$wrappedArgs,*])

syntax "\\!" "[embed," str "]" : sakuraSignum
macro_rules | `(expandSignum \![embed, $e]) => `(Signaculum.Sakura.insere $e)

syntax "\\!" "[embed," ident term* "]" : sakuraSignum
macro_rules
| `(expandSignum \![embed, $f:ident $args:term*]) => do
  let nameStr := Lean.Syntax.mkStrLit f.getId.toString
  let wrappedArgs ← args.mapM fun a => `(Signaculum.Memoria.Citatio.toRef $a)
  `(Signaculum.Sakura.insere $nameStr [$wrappedArgs,*])

syntax "\\!" "[notify," str "]" : sakuraSignum
macro_rules | `(expandSignum \![notify, $e]) => `(Signaculum.Sakura.notifica $e)

syntax "\\!" "[notify," ident term* "]" : sakuraSignum
macro_rules
| `(expandSignum \![notify, $f:ident $args:term*]) => do
  let nameStr := Lean.Syntax.mkStrLit f.getId.toString
  let wrappedArgs ← args.mapM fun a => `(Signaculum.Memoria.Citatio.toRef $a)
  `(Signaculum.Sakura.notifica $nameStr [$wrappedArgs,*])

-- タイマーにゃん
syntax "\\!" "[timerraise," term "," term "," str "]" : sakuraSignum
macro_rules | `(expandSignum \![timerraise, $t, $r, $e]) => `(Signaculum.Sakura.excitaPostTempus $t $r $e)

-- ident + term*（引數なし・あり共通）にゃ
syntax "\\!" "[timerraise," term "," term "," ident term* "]" : sakuraSignum
macro_rules
| `(expandSignum \![timerraise, $t, $r, $f:ident $args:term*]) => do
  let nameStr := Lean.Syntax.mkStrLit f.getId.toString
  let wrappedArgs ← args.mapM fun a => `(Signaculum.Memoria.Citatio.toRef $a)
  `(Signaculum.Sakura.excitaPostTempus $t $r $nameStr [$wrappedArgs,*])

syntax "\\!" "[timernotify," term "," term "," str "]" : sakuraSignum
macro_rules | `(expandSignum \![timernotify, $t, $r, $e]) => `(Signaculum.Sakura.notificaPostTempus $t $r $e)

-- ident + term*（引數なし・あり共通）にゃ
syntax "\\!" "[timernotify," term "," term "," ident term* "]" : sakuraSignum
macro_rules
| `(expandSignum \![timernotify, $t, $r, $f:ident $args:term*]) => do
  let nameStr := Lean.Syntax.mkStrLit f.getId.toString
  let wrappedArgs ← args.mapM fun a => `(Signaculum.Memoria.Citatio.toRef $a)
  `(Signaculum.Sakura.notificaPostTempus $t $r $nameStr [$wrappedArgs,*])



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

-- 非同期起動にゃん
syntax "\\!" "[async," ident term* "]" : sakuraSignum
macro_rules
| `(expandSignum \![async, $f:ident $args:term*]) => do
  let callTerm ← `($f $args*)
  `(liftM (Signaculum.spawnaMunitus do
      let _s ← Signaculum.Sakura.currere $callTerm
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
