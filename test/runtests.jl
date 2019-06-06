module CellwiseValuesTests

using CellwiseValues
using Test

include("CellValuesMocks.jl")

include("MapsMocks.jl")

@time @testset "CellValuesMocks" begin include("CellValuesMocksTests.jl") end

@time @testset "MapsMocks" begin include("MapsMocksTests.jl") end

@time @testset "Gallery" begin include("GalleryTests.jl") end

@time @testset "Kernels" begin include("KernelsTests.jl") end

#@testset "NumberOperations" begin include("NumberOperationsTests.jl") end

end # module CellwiseValuesTests
