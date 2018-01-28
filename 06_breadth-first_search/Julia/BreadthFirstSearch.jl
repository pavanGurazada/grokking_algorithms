using LightGraphs

function personIsSeller(name::String)
    return name[-1] == "m"
end

G = DiGraph()

add_vertices!(G, 8)
add_edge!(G, (1, 2))
add_edge!(G, (1, 3))
