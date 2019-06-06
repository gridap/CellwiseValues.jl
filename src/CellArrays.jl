module CellArrays

using CellwiseValues

export CellArray
export CellMatrix
export CellVector

export IterCellArray
export IterCellMatrix
export IterCellVector

export IndexCellArray
export IndexCellMatrix
export IndexCellVector

# Iterable cell Arrays

const IterCellArray{T,N,A<:AbstractArray{T,N}} = IterCellValue{A}

const IterCellVector{T,A} = IterCellArray{T,1,A}

const IterCellMatrix{T,A} = IterCellArray{T,2,A}

# Indexable cell arrays

const IndexCellArray{T,N,A<:AbstractArray{T,N},D} = IndexCellValue{A,D}

const IndexCellVector{T,A<:AbstractArray{T,1},D} = IndexCellArray{T,1,A,D}

const IndexCellMatrix{T,A<:AbstractArray{T,2},D} = IndexCellArray{T,2,A,D}

# Cell Arrays

const CellArray{T,N} = Union{IterCellArray{T,N},IndexCellArray{T,N}}

const CellVector{T} = CellArray{T,1}

const CellMatrix{T} = CellArray{T,2}

end # module CellArrays

