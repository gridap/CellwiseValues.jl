module CellwiseValues

using Reexport

# To be ported to TensorValues
using TensorValues
import Base: sum
import Base: +, -, *, /
sum(a::MultiValue) = sum(a.array)
for op in (:+,:-,:*)
  @eval begin
    ($op)(a::MultiValue,b::Number) = MultiValue($op(a.array,b))
    ($op)(a::Number,b::MultiValue) = MultiValue($op(a,b.array))
  end
end
(/)(a::MultiValue,b::Number) = MultiValue(a.array/b)

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
