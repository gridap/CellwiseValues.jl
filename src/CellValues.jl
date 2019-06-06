module CellValues

using CellwiseValues

export CellValue
export IterCellValue
export IndexCellValue

import Base: iterate
import Base: length
import Base: eltype
import Base: size
import Base: getindex
import Base: IndexStyle
import Base: show

abstract type IterCellValue{T} end

function iterate(::IterCellValue{T})::Union{Nothing,Tuple{T,Any}} where T
  @abstractmethod
end

function iterate(::IterCellValue{T},state)::Union{Nothing,Tuple{T,Any}} where T
  @abstractmethod
end

length(::IterCellValue)::Int = @abstractmethod

eltype(::Type{C}) where C <: IterCellValue{T} where T = T

# Indexable cell Values

abstract type IndexCellValue{T,N} <: AbstractArray{T,N} end

function getindex(::IndexCellValue{T,N}, ::Vararg{Int,N})::T where {T,N}
  @abstractmethod
end

size(x::IndexCellValue) = @abstractmethod

IndexStyle(::Type{<:IndexCellValue{T,N}} where {T,N}) = IndexLinear()

# Cell Values

const CellValue{T} = Union{IterCellValue{T},IndexCellValue{T}}

function show(io::IO,self::CellValue)
  for (i, a) in enumerate(self)
    println(io,"$i -> $a")
  end
end

end # module CellValues
