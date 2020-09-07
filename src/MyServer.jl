module MyServer

using Logging, LoggingExtras

function main()
  Base.eval(Main, :(const UserApp = MyServer))

  include(joinpath("..", "genie.jl"))

  Base.eval(Main, :(const Genie = MyServer.Genie))
  Base.eval(Main, :(using Genie))
end; main()

end
