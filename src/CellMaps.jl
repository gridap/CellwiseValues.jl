module CellMaps

using Test
using CellwiseValues

export CellMap
export IterCellMap
export IndexCellMap
import CellwiseValues: evaluate
export test_iter_cell_map
export test_index_cell_map

"""
Abstract object that traverses a set of cells and at every cell returns a
`Map{S,M,T,N}`
"""
const IterCellMap{S,M,T,N,R<:Map{S,M,T,N}} = IterCellValue{R}

"""
Abstract array indexed by cells that returns a `Map{S,M,T,N}`
"""
const IndexCellMap{S,M,T,N,C,R<:Map{S,M,T,N}} = IndexCellValue{R,C}

"""
Abstract object that for a given cell index returns a `Map{S,M,T,N}`
"""
const CellMap{S,M,T,N} = Union{IterCellMap{S,M,T,N},IndexCellMap{S,M,T,N}}

"""
Return the cellwise maps of a `CellMap` on a cellwise set of points
"""
function evaluate(::CellMap{S,M,T,N},::CellArray{S,M})::CellArray{T,N} where {S,M,T,N}
  @abstractmethod
end

# Testers

function test_iter_cell_map(
  m::CellMap{S,M,T,N},
  a::CellArray{S,M},
  b::AbstractArray{<:AbstractArray{T,N}}) where {S,M,T,N}

  @test length(m) == length(b)
  @test length(m) == length(a)

  c = evaluate(m,a)
  test_iter_cell_array(c,b)

  for (mi,ai,bi) in zip(m,a,b)
    @assert isa(mi,Map{S,M,T,N})
    @assert evaluate(mi,ai) ≈ bi
  end

end

function test_index_cell_map(
  m::IndexCellMap{S,M,T,N},
  a::CellArray{S,M},
  b::AbstractArray{<:AbstractArray{T,N}}) where {S,M,T,N}

  @test size(m) == size(b)

  @test IndexStyle(m) == IndexStyle(b)

  test_iter_cell_map(m,a,b)

  for (i,ai) in enumerate(a)
    mi = m[i]
    bi = b[i]
    @assert isa(mi,Map{S,M,T,N})
    @assert evaluate(mi,ai) ≈ bi
  end

end

end # module CellMaps
