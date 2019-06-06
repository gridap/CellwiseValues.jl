module NumberOperations


struct CellNumberFromKernel{T,K,V} <: IterCellNumber{T}
  kernel::K
  cellvalues::V
end

function CellNumberFromKernel(
  k::NumberKernel{N},v::Vararg{<:CellValue,N}) where N
  _checks(v)
  T = _compute_type(k,v)
  @assert T <: NumberLike
  V = typeof(v)
  K = typeof(k)
  CellNumberFromKernel{T,V,K}(v,k)
end

function _checks(v)
  @assert length(v) > 0
  v1, _ = v
  l = length(v1)
  @assert all( ( length(vi) == l for vi in v ) )
end

function _compute_type(k,v)
  compute_type(k,[ typeof(vi) for vi in v ]...)
end

function length(self::CellNumberFromKernel)
  vi, _ = self.cellvalues
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

@inline function _iterate(
  self::CellNumberFromUnaryKernel,znext,zipped)
  if znext === nothing; return nothing end
  a, zstate = znext
  r = compute_value(self.kernel,a...)
  state = (zipped,zstate)
  (r, state)
end


end # module NumberOperations
