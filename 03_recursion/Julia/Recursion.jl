function countdown(i::Int)
    print(i)

    if i <= 0
        return nothing
    else
        return countdown(i-1)
    end
end

@time countdown(5)

function factorialInt(n::Int)
    if n == 1
        return 1
    else
        return n * factorial(n-1)
    end
end

@time factorialInt(5)
