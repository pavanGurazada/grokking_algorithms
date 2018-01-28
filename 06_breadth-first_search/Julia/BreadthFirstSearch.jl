using LightGraphs

function personIsOdd(name::Int)
    return (name % 2) != 0
end

G = DiGraph()

add_vertices!(G, 8)
add_edge!(G, (1, 2))
add_edge!(G, (1, 3))
add_edge!(G, (1, 4))
add_edge!(G, (2, 5))
add_edge!(G, (2, 6))
add_edge!(G, (3, 6))
add_edge!(G, (4, 7))
add_edge!(G, (4, 8))

function searchGraph(vertex::T, G::LightGraphs.SimpleGraphs.SimpleDiGraph{T}) where T <: Int
    searchQueue = neighbors(G, vertex)
    searched = []

    while !isempty(searchQueue)
        node = pop!(searchQueue)

        if !(node in searched)
            if personIsOdd(node)
                println(node, " is odd!")
                return true
            else
                append!(searchQueue, neighbors(G, node))
                append!(searched, node)
            end
        end
    end
    return false
end

@time searchGraph(5, G)
