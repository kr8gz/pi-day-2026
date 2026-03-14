# Gauss-Legendre Algorithm for π in 157* programming languages**
[![wakatime](https://wakatime.com/badge/github/ggodpl/pi-day-2026.svg)](https://wakatime.com/badge/github/ggodpl/pi-day-2026)

[Gauss-Legendre algorithm](https://en.wikipedia.org/wiki/Gauss%E2%80%93Legendre_algorithm) implementation in 157 programming languages. I was originally going to go for 314 but I had way too much confidence in my abilities and only started 2 weeks before π day so I had to rescope to half that.

Each language implements a Gauss-Legendre subroutine/function/procedure/whatever it's called in the documentation, calls it and prints the result.
If the language does not have a `sqrt` function, Newton-Raphson method is used. 
If the langauge does not even support floats or decimals, an integer with scaling is used (scale depends on the language since different languages support different ints).
For this project the precision that each language produces is really not that important as it's mostly just a showcase of different syntax differences, like Rosetta code but less languages, one task and lower effort.

I'm not 100% sure all of these programs work. I tried to test all of them, but finding a working (and free) compiler that wasn't very complex to setup or didn't require a very specific environment was not always easy.

Also, all of the code here was written by me and I don't know how to code in 157 languages, so each implementation might not be the most idiomatic and beautful thing to ever exist, and I'm sorry if I butchered the style guide of your favorite programming language.

\* There are at least a few languages that are extremely similar or pretty much identical, but it's my project so I make the rules. Versions of the same language (like Python2 vs Python3 or AHK v1.1 vs AHK v2.0) are also allowed if they are not exactly the same.

** And [TypeScript types](https://github.com/ggodpl/pi-day-2026/blob/main/languages/typescript-types.d.ts)

### Why?
fun

## Languages
**157/157** (100%) languages are implemented:

| Language | File |
|----------|------|
| ABAP | `abap.abap` |
| ABC | `abc.abc` |
| ActionScript | `actionscript.as` |
| Ada | `ada.adb` |
| Agda | `agda.agda` |
| ALGOL 68 | `algol68.a68` |
| Alice ML | `alice-ml.aml` |
| AngelScript | `angelscript.as` |
| APL | `apl.apl` |
| AppleScript | `applescript.applescript` |
| Assembly | `assembly.asm` |
| AssemblyScript | `assemblyscript.ts` |
| AutoHotkey v1.1 | `autohotkey-v1.ahk` |
| AutoHotkey v2 | `autohotkey-v2.ahk` | 
| AWK | `awk.awk` |
| B | `b.b` |
| Ballerina | `ballerina.bal` |
| Bash | `bash.sh` |
| BASIC (FreeBASIC) | `basic.bas` |
| Batch | `batch.bat` |
| BeanShell | `beanshell.bsh` |
| Boo | `boo.boo` |
| C | `c.c` |
| Caboose | `caboose.cb` |
| Ceylon | `ceylon.ceylon` |
| Chapel | `chapel.chpl` |
| Clojure | `clojure.clj` |
| COBOL | `cobol.cbl` |
| CoffeeScript | `coffeescript.coffee` |
| Common Lisp | `common-lisp.cl` |
| C++ | `cpp.cpp` |
| Crystal | `crystal.cr` |
| C# | `c-sharp.cs` |
| D | `d.d` |
| Dart | `dart.dart` |
| Delphi | `delphi.dpr` |
| EasyLang | `easylang.el` |
| Eiffel | `eiffel.e` |
| Elixir | `elixir.exs` |
| Elm | `elm.elm` |
| Erlang | `erlang.erl` |
| Euphoria | `euphoria.exw` |
| ezylang | `ezylang.ezy` |
| F# | `f-sharp.fs` |
| Fantom | `fantom.fan` |
| Fortran 77 | `fortran-77.f` |
| Fortran 95 | `fortran-95.f95` |
| Futhark | `futhark.fut` |
| GameMaker Language | `gamemaker-language.gml` |
| GDScript | `gdscript.gd` |
| Gleam | `gleam.gleam` |
| Golang | `golang.go` |
| Golo | `golo.golo` |
| Grain | `grain.gr` |
| Groovy | `groovy.groovy` |
| Gura | `gura.gura` |
| Hack | `hack.hack` |
| Harbour | `harbour.hb` |
| Hare | `hare.ha` |
| Haskell | `haskell.hs` |
| Haxe | `haxe.hx` |
| HolyC | `holyc.hc` |
| Hy | `hy.hy` |
| IcedCoffeeScript | `icedcoffeescript.iced` |
| Icon | `icon.icn` |
| Idris | `idris.idr` |
| Io | `io.io` |
| J | `j.j` |
| Java | `java.java` |
| JavaScript | `javascript.js` |
| JScript | `jscript.js` |
| Julia | `julia.jl` |
| Koka | `koka.kk` |
| Kotlin Script | `kotlin-script.kts` |
| Kotlin | `kotlin.kt` |
| LiveScript | `livescript.ls` |
| Lua | `lua.lua` |
| Luau | `luau.luau` |
| Maple | `maple.mpl` |
| Maxima | `maxima.mc` |
| Mercury | `mercury.m` |
| Modula-2 | `modula-2.m2` |
| Mojo | `mojo.🔥` |
| Monkey C | `monkey-c.mc` |
| MoonScript | `moonscript.moon` |
| MY-BASIC | `my-basic.bas` |
| Nelua | `nelua.nelua` |
| Nemerle | `nemerle.n` |
| Nim | `nim.nim` |
| Oberon | `oberon.mod` |
| Objective-C | `objective-c.m` |
| Objective-C++ | `objective-cpp.mm` |
| OCaml | `ocaml.ml` |
| Octave | `octave.m` |
| Odin | `odin.odin` |
| Pascal | `pascal.pas` |
| PascalABC.NET | `pascalabc-net.pas` |
| Perl | `perl.pl` |
| Phix | `phix.exw` |
| PHP | `php.php` |
| Pike | `pike.pike` |
| Pluto | `pluto.pluto` |
| Pony | `pony.pony` |
| PowerShell | `powershell.ps1` |
| Prolog | `prolog.pro` |
| PureScript | `purescript.purs` |
| Python | `python.py` |
| Python2 | `python2.py` |
| Q# | `q-sharp.qs` |
| R | `r.r` |
| Racket | `racket.rkt` |
| Reason | `reason.re` |
| REBOL | `rebol.reb` |
| Red | `red.red` |
| ReScript | `rescript.res` |
| Ring | `ring.ring` |
| Rocq (Coq) | `rocq.v` |
| Ruby | `ruby.rb` |
| Rust | `rust.rs` |
| Scala | `scala.scala` |
| SceneScript | `scenescript.ss` |
| Scheme | `scheme.scm` |
| Scratch | `scratch.sb3` |
| Seed7 | `seed7.sd7` |
| Self | `self.self` |
| shitlang | `shitlang.shit` |
| Sidef | `sidef.sf` |
| Smalltalk | `smalltalk.st` |
| Solidity | `solidity.sol` |
| SpeckyLang | `speckylang.specky` |
| SPWN | `spwn.spwn` |
| Squirrel | `squirrel.nut` |
| Standard ML | `standard-ml.sml` |
| Starlark | `starlark.star` |
| Swift | `swift.swift` |
| Tcl | `tcl.tcl` |
| Teal | `teal.tl` |
| TeaScript | `teascript.tea` |
| Terra | `terra.t` |
| ToffeeScript | `toffeescript.toffee` |
| TypeScript type system | `typescript-types.d.ts` |
| TypeScript | `typescript.ts` |
| uBASIC | `ubasic.bas` |
| V | `v.v` |
| Vala | `vala.vala` |
| Vale | `vale.vale` |
| VBScript | `vbscript.vbs` |
| Visual Basic for Applications | `visual-basic-for-applications.vba` |
| Visual Basic | `visual-basic.vb` |
| Wolfram Language (Mathematica) | `wolfram-mathematica.wl` |
| Wren | `wren.wren` |
| X | `x.x` |
| X++ | `xpp.xpp` |
| Xtend | `xtend.xtend` |
| Yabasic | `yabasic.yab` |
| Zig | `zig.zig` |
