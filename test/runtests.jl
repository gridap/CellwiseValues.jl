module CellwiseValuesTests

using CellwiseValues
using Test

include("CellValuesMocks.jl")

include("MapsMocks.jl")

@time @testset "CellValuesMocks" begin include("CellValuesMocksTests.jl") end

@time @testset "MapsMocks" begin include("MapsMocksTests.jl") end

@time @testset "Gallery" begin include("GalleryTests.jl") end

@time @testset "Kernels" begin include("KernelsTests.jl") end

@time @testset "CellNumberApply" begin include("CellNumberApplyTests.jl") end

@time @testset "CachedArrays" begin include("CachedArraysTests.jl") end

@time @testset "CellArrayApply" begin include("CellArrayApplyTests.jl") end

@time @testset "MapApply" begin include("MapApplyTests.jl") end

@time @testset "CellMapApply" begin include("CellMapApplyTests.jl") end

end # module CellwiseValuesTests
