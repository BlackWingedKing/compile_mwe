module precompile_mwe
    using Turing
    Turing.setadbackend(:reversediff)
    Turing.setrdcache(true)

    greet() = print("Hello World!")
end # module
