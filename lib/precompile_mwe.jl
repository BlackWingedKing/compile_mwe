module Precompile_mwe
    using Turing, ReverseDiff, Memoization
    Turing.setadbackend(:reversediff)
    Turing.setrdcache(true)
    greet() = print("Hello World!")
end # module
