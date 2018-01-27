using Distributions

srand(20130810)

function binarySearch(list,
                      item)
    # [low, high] region of the list is being searched
    low = 1
    high = length(list)

    while low <= high
        mid = floor(Int, (low+high)/2)
        guess = list[mid]

        if guess == item
            return mid
        end

        if guess > item
            high = mid - 1
        else
            low = mid + 1
        end
    end

    return "Not found"
end

myList = [1, 3, 5, 7, 9]
print(binarySearch(myList, 3))

myRandomList = rand(Uniform(), 10^6)
@time binarySearch(myRandomList, 0.5)
