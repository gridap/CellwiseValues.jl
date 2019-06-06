module CellNumbers

using CellwiseValues

using StaticArrays

export NumberLike
export CellNumber
export IterCellNumber
export IndexCellNumber

const NumberLike = Union{Number,SArray}

# Iterable cell Numbers

const IterCellNumber{A<:NumberLike} = IterCellValue{A}

# Indexable cell arrays

const IndexCellNumber{A<:NumberLike,D} = IndexCellValue{A,D}

# Cell Numbers

const CellNumber{A} = Union{IterCellNumber{A},IndexCellNumber{A}}

end # module CellNumbers
