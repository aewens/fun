class Point
    constructor: (x, y) ->
        [@x, @y] = M(x, y).diverge([0,0])
    get: -> [@x, @y]
    set: (x, y) -> 
        [@x, @y] = M(x, y).diverge([0,0])
        @
        
window.Point = Point
