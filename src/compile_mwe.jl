module compile_mwe
    using Turing, ReverseDiff
    using Memoization
    Turing.setadbackend(:reversediff)
    # Turing.setadbackend(:reverse_diff)
    Turing.setrdcache(true)

    greet() = print("Hello World!")
end # module
