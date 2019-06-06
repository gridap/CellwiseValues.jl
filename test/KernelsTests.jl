module KernelsTests

using CellwiseValues
using StaticArrays
using TensorValues

k = NumberKernelFromFunction(-)

test_number_kernel(k,1,4,3)

test_number_kernel(k,-1.0,1.0)

k = NumberKernelFromFunction(sum)

test_number_kernel(k,7,[1,2,4])

end # module KernelsTests
