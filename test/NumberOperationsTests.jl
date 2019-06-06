include("../src/NumberOperations.jl")
module NumberOperationsTests

using Test
using CellwiseValues
using ..CellValuesMocks
using ..NumberOperations
using StaticArrays
using TensorValues

l = 10

k = NumberKernelFromFunction(-)

for a in [1.2, SVector(1.3,2.0), VectorValue(1.3,2.0)]

  v = TestIterCellValue(a,l)
  
  w = apply(k,v)
  
  o = [ -vi for vi in v ] 
  
  test_iter_cell_value(w,o)

end

k = NumberKernelFromFunction(sum)

for a in [[1,2,3], SVector(1.3,2.0), VectorValue(1.3,2.0)]

  v = TestIterCellValue(a,l)
  
  w = apply(k,v)
  
  o = [ sum(vi) for vi in v ] 
  
  test_iter_cell_value(w,o)

end

end # module NumberOperationsTests
