include("lib/precompile_mwe.jl")

using Genie.Router
using Precompile_mwe

route("/") do
  serve_static_file("welcome.html")
end

route("/hello") do
  return Precompile_mwe.greet()
end
