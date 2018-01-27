# Finds the smallest value in an array
function findSmallest(arr::Vector{T}) where T <: Real
    # Store the smallest value and its index
    smallestIndex, smallest = 1, arr[1]

    for i in 2:length(arr)
        if arr[i] < smallest
            smallest = arr[i]
            smallestIndex = i
        end
    end
    return smallestIndex
end

# Sort array
function selectionSort(arr::Vector{T}) where T <: Real
    newArr = []

    for i in 1:length(arr)
      # Finds the index of the smallest element in the array
      # and adds it to the new array
      smallest = findSmallest(arr)
      append!(newArr, splice!(arr, smallest))
    end

  return newArr
end

@time selectionSort([5, 3, 6, 2, 10])
