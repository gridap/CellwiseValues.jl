module Kernels

using Test
using CellwiseValues

export NumberKernel
export NumberKernelFromFunction
export compute_type
export compute_value
export test_number_kernel

# Interfaces

abstract type NumberKernel end

function compute_type(::NumberKernel,::Vararg{<:Type})::Type{<:NumberLike}
  @abstractmethod
end

function compute_value(::NumberKernel,::Vararg)::NumberLike
  @abstractmethod
end

# Testers

function test_number_kernel(k::NumberKernel,o::T,i::Vararg) where T
  t = [ typeof(ii) for ii in i ]
  S = compute_type(k,t...)
  @test S == T
  r = compute_value(k,i...)
  @test r == o
end

# Implementations

struct NumberKernelFromFunction{F<:Function} <: NumberKernel
  fun::F
end

function compute_type(
  self::NumberKernelFromFunction,types::Vararg{<:Type})
  T = Base._return_type(self.fun,types)
  @assert T <: NumberLike
  T
end

function compute_value(self::NumberKernelFromFunction,args::Vararg)
  self.fun(args...)
end

end # module Kernels
