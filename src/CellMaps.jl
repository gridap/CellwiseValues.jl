module CellMaps

using CellwiseValues

export CellMap
export IterCellMap
export IndexCellMap
import CellwiseValues: evaluate

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

end # module CellMaps
