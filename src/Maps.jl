module Maps

using CellwiseValues

export Map
export evaluate!
export evaluate
export return_size

"""
Abstract map that takes an `M`-dim array of `S` values and returns an `N`-dim
array of `T` values
"""
abstract type Map{S,M,T,N} end

"""
Evaluate a `Map` on a set of points
"""
function evaluate!(
  this::Map{S,M,T,N},
  points::AbstractArray{S,M},
  v::AbstractArray{T,N}) where {S,M,T,N}
  @abstractmethod
end

"""
Return dimension of the output array
"""
function return_size(
  ::Map{S,M,T,N},::NTuple{M,Int})::NTuple{N,Int} where {S,M,T,N}
  @abstractmethod
end

"""
Same as `evaluate!` but allocates output
"""
function evaluate(
  this::Map{S,M,T,N},
  points::AbstractArray{S,M}) where {S,M,T,N}
  v_size = return_size(this, size(points))
  v = Array{T,N}(undef, v_size)
  evaluate!(this,points,v)
  return v
end

end # module Maps
