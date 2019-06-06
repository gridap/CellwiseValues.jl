module NumberOperations

using CellwiseValues

export apply
import Base: iterate
import Base: length
import Base: size
import Base: getindex
import Base: IndexStyle

function apply(k::NumberKernel,v::Vararg{<:CellValue})
  CellNumberFromKernel(k,v...)
end

function apply(f::Function,v::Vararg{<:CellValue})
  t = _eltypes(v)
  T = Base._return_type(f,t)
  _apply(T,f,v)
end

function _apply(T,f,v)
  @notimplemented
end

function _apply(T::Type{<:NumberLike},f,v)
  k = NumberKernelFromFunction(f)
  apply(k,v...)
end

function _eltypes(v)
  tuple([ eltype(vi) for vi in v ]...)
end

struct CellNumberFromKernel{T,K,V} <: IterCellNumber{T}
  kernel::K
  cellvalues::V
end

function CellNumberFromKernel(k::NumberKernel,v::Vararg{<:CellValue})
  _checks(v)
  T = _compute_type(k,v)
  K = typeof(k)
  V = typeof(v)
  CellNumberFromKernel{T,K,V}(k,v)
end

function _checks(v)
  @assert length(v) > 0
  v1, = v
  l = length(v1)
  @assert all( ( length(vi) == l for vi in v ) )
end

function _compute_type(k,v)
  t = _eltypes(v)
  T = compute_type(k,t...)
  @assert T <: NumberLike
  T
end


function length(self::CellNumberFromKernel)
  vi, = self.cellvalues
  length(vi)
end

@inline function iterate(self::CellNumberFromKernel)
  zipped = zip(self.cellvalues...)
  znext = iterate(zipped)
  _iterate(self,znext,zipped)
end

@inline function iterate(self::CellNumberFromKernel,state)
  zipped, zstate = state
  znext = iterate(zipped,zstate)
  _iterate(self,znext,zipped)
end

@inline function _iterate(self::CellNumberFromKernel,znext,zipped)
  if znext === nothing; return nothing end
  a, zstate = znext
  r = compute_value(self.kernel,a...)
  state = (zipped,zstate)
  (r, state)
end

end # module NumberOperations
