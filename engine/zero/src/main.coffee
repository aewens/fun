require.config
    urlArgs: "nocache=" + (new Date).getTime()
        
require [
    "point",
    "vector"
], (P, V) ->
    console.log pos1 = P(1, 2)
    console.log vec1 = V(2, 3)
    console.log pos1.add(vec1)
