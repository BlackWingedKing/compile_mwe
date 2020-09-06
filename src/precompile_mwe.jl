module precompile_mwe
    using Turing, ReverseDiff, Memoization
    Turing.setadbackend(:reverse_diff)
    Turing.setrdcache(true)
    greet() = print("Hello World!")
end # module
