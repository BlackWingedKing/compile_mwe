## Reproducing the error from the fork
Following the discussion [here](https://github.com/TuringLang/Turing.jl/issues/1400)

I have forked turing repo (ad.jl branch which adds [this](https://github.com/TuringLang/Turing.jl/pull/1401) PR)
and made these following changes
* Added ReverseDiff, Memoization as a dependecy for Turing
* removed `@require` macro for ReverseDiff and Memoization
* moved `./src/core/compat/reversediff.jl` to `./src/core/reversediff.jl` 

The fork can be found [here](https://github.com/BlackWingedKing/Turing.jl)

Now I have run the following commands for precompilation

```
(@v1.5) pkg> activate .
(precompile_mwe) pkg> rm Turing
(precompile_mwe) pkg> add https://github.com/BlackWingedKing/Turing.jl
```
These commands remove the main Turing dependency and adds the fork as a dependency  
After this leave the package mode once to check the reversediff dependecy added
```
julia> using Turing

julia> Turing.setadbackend(:reversediff)
:reversediff

```
(Note that we are able to set the backend without loading ReverseDiff pkg)  
Now once, again enter package mode to precompile

```

(precompile_mwe) pkg> instantiate

(precompile_mwe) pkg> precompile
```

After doing this we get the same error
```
[ Info: Precompiling Turing [fce5fe82-541a-59a6-adf8-730c64b5f9a0]
[ Info: Precompiling precompile_mwe [0f5867d9-2310-4ee1-a733-e9703dd06800]
ERROR: LoadError: MethodError: no method matching setadbackend(::Val{:reversediff})
Closest candidates are:
  setadbackend(::Val{:tracker}) at /home/ritesh/.julia/packages/AdvancedVI/PaSeO/src/ad.jl:19
  setadbackend(::Val{:reverse_diff}) at /home/ritesh/.julia/packages/AdvancedVI/PaSeO/src/ad.jl:15
  setadbackend(::Val{:forwarddiff}) at /home/ritesh/.julia/packages/AdvancedVI/PaSeO/src/ad.jl:10
  ...
Stacktrace:
 [1] setadbackend(::Val{:reversediff}) at /home/ritesh/.julia/packages/Turing/0MRHi/src/core/ad.jl:8
 [2] setadbackend(::Symbol) at /home/ritesh/.julia/packages/Turing/0MRHi/src/core/ad.jl:5
 [3] top-level scope at /home/ritesh/Desktop/compilation/precompile_mwe_1/src/precompile_mwe.jl:3
 [4] include(::Function, ::Module, ::String) at ./Base.jl:380
 [5] include(::Module, ::String) at ./Base.jl:368
 [6] top-level scope at none:2
 [7] eval at ./boot.jl:331 [inlined]
 [8] eval(::Expr) at ./client.jl:467
 [9] top-level scope at ./none:3
in expression starting at /home/ritesh/Desktop/compilation/precompile_mwe_1/src/precompile_mwe.jl:3
```