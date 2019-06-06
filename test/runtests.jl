module CellwiseValuesTests

using CellwiseValues
using Test

include("CellValuesMocks.jl")

include("MapsMocks.jl")

@testset "CellValuesMocks" begin include("CellValuesMocksTests.jl") end

@testset "MapsMocks" begin include("MapsMocksTests.jl") end

@testset "Gallery" begin include("GalleryTests.jl") end

end # module CellwiseValuesTests
