module CellwiseValuesTests

using CellwiseValues
using Test

include("CellValuesMocks.jl")

include("MapsMocks.jl")

@time @testset "CellValuesMocks" begin include("CellValuesMocksTests.jl") end

@time @testset "MapsMocks" begin include("MapsMocksTests.jl") end

@time @testset "Gallery" begin include("GalleryTests.jl") end

@time @testset "Kernels" begin include("KernelsTests.jl") end

@time @testset "NumberOperations" begin include("NumberOperationsTests.jl") end

@time @testset "CachedArrays" begin include("CachedArraysTests.jl") end

@time @testset "ArrayOperations" begin include("ArrayOperationsTests.jl") end

@time @testset "MapOperations" begin include("MapOperationsTests.jl") end

end # module CellwiseValuesTests
