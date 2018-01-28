# A general principle in recursion is to identify the base case where the solution
# is trivial and then redefine the problem recursively to reach that base case

function sumArr(arr::Vector{T}) where T <: Real
    total = 0
    for x in arr
        total += x
    end
    return total
end

@time sum([1, 2, 3, 4])

function recursiveSumArr(arr::Vector{T}) where T <: Real
    if isempty(arr)
        return 0
    else
        return arr[1] + sumArr(arr[2:end])
    end
end

@time recursiveSumArr([1, 2, 3, 4])

function quickSort(arr::Vector{T}) where T <:Real
    if length(arr) < 2
        # Arrays with length 0 or 1 are already sorted
        return arr
    else
        pivot = arr[1]
        # sub-array of all the elements less than the pivot
        less = [i for i in arr[2:end] if i <= pivot]
        # sub-array of all the elements more than the pivot
        more = [i for i in arr[2:end] if i > pivot]
        return vcat(quickSort(less), [pivot], quickSort(more))
    end
end

@time quickSort([10, 5, 2, 3])
