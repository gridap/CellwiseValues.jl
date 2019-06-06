module CellwiseValues

using Reexport

# To be ported to TensorValues
using TensorValues
import Base: sum
sum(a::MultiValue) = sum(a.array)

include("Helpers.jl")
@reexport using CellwiseValues.Helpers

include("CellValues.jl")
@reexport using CellwiseValues.CellValues

include("CellNumbers.jl")
@reexport using CellwiseValues.CellNumbers

include("CellArrays.jl")
@reexport using CellwiseValues.CellArrays

include("Maps.jl")
@reexport using CellwiseValues.Maps

include("CellMaps.jl")
@reexport using CellwiseValues.CellMaps

include("Gallery.jl")
@reexport using CellwiseValues.Gallery

include("Kernels.jl")
@reexport using CellwiseValues.Kernels

#include("NumberOperations.jl")
#@reexport using CellwiseValues.NumberOperations

end # module
