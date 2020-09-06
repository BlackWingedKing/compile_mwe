# precompile_mwe
a small mwe demonstrating the precompilation error of Turing with reversediff backend in julia

## Reproducing the error
* open REPL and execute the following commands
* enter the package mode (press `]`)
```
(@v1.5) pkg> activate .
```
```
(compile_mwe) pkg> instantiate
```
```
(compile_mwe) pkg> precompile
```
* This gives the output (error)
```
Precompiling project...
[ Info: Precompiling compile_mwe [7827dd30-f290-46cf-b59c-50a3b88917c5]
ERROR: LoadError: MethodError: no method matching setadbackend(::Val{:reversediff})
Closest candidates are:
  setadbackend(::Val{:tracker}) at /home/ritesh/.julia/packages/Turing/RzDvB/src/core/ad.jl:23
  setadbackend(::Val{:reverse_diff}) at /home/ritesh/.julia/packages/Turing/RzDvB/src/core/ad.jl:19
  setadbackend(::Val{:forwarddiff}) at /home/ritesh/.julia/packages/Turing/RzDvB/src/core/ad.jl:14
  ...
Stacktrace:
 [1] setadbackend(::Symbol) at /home/ritesh/.julia/packages/Turing/RzDvB/src/core/ad.jl:6
 [2] top-level scope at /home/ritesh/Desktop/projects/tapestry/compile_mwe/src/compile_mwe.jl:4
 [3] include(::Function, ::Module, ::String) at ./Base.jl:380
 [4] include(::Module, ::String) at ./Base.jl:368
 [5] top-level scope at none:2
 [6] eval at ./boot.jl:331 [inlined]
 [7] eval(::Expr) at ./client.jl:467
 [8] top-level scope at ./none:3
in expression starting at /home/ritesh/Desktop/projects/tapestry/compile_mwe/src/compile_mwe.jl:4
```
* Now if I change comment line 4, uncomment line 5 of `src/compile_mwe.jl` and repeat the above steps 
* I get the following error
```
[ Info: Precompiling compile_mwe [7827dd30-f290-46cf-b59c-50a3b88917c5]
ERROR: LoadError: MethodError: no method matching setadbackend(::Val{:reverse_diff})
Closest candidates are:
  setadbackend(::Val{:zygote}) at /home/ritesh/.julia/packages/Bijectors/66bcj/src/interface.jl:21
  setadbackend(::Val{:tracker}) at /home/ritesh/.julia/packages/Bijectors/66bcj/src/interface.jl:20
  setadbackend(::Val{:reversediff}) at /home/ritesh/.julia/packages/Bijectors/66bcj/src/interface.jl:19
  ...
Stacktrace:
 [1] setadbackend(::Symbol) at /home/ritesh/.julia/packages/Turing/RzDvB/src/core/ad.jl:8
 [2] top-level scope at /home/ritesh/Desktop/projects/tapestry/compile_mwe/src/compile_mwe.jl:5
 [3] include(::Function, ::Module, ::String) at ./Base.jl:380
 [4] include(::Module, ::String) at ./Base.jl:368
 [5] top-level scope at none:2
 [6] eval at ./boot.jl:331 [inlined]
 [7] eval(::Expr) at ./client.jl:467
 [8] top-level scope at ./none:3
in expression starting at /home/ritesh/Desktop/projects/tapestry/compile_mwe/src/compile_mwe.jl:5
```
* stuck in a loop 😅
