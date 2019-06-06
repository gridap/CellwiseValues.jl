module CellwiseValuesTests

using CellwiseValues
using Test

include("CellValuesMocks.jl")

@testset "CellValuesMocks" begin include("CellValuesMocksTests.jl") end

end # module CellwiseValuesTests
