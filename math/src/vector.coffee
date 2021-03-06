class Vector
    constructor: (x, y) ->
        @head = new Point(x, y)
    set: (args...) ->
        if args.length is 1
            if args[0] instanceof Point then @tail = args[0]
            else if args[0] instanceof Vector then @tail = args[0].head
        else if args.lenths is 2
            @tail = new Point(args[0], args[1])
        else
            @tail = new Point(0, 0)
        @
    add: (v) ->
        x = @head.x + v.head.x
        y = @head.y + v.head.y
        new Vector(x, y).set(@tail)
    mult: (n) ->
        @head.set(@head.x * n, @head.y * n) if typeof n is "number"
        @
    magnitude: ->
        sqrt(sqre(@head.x) + sqre(@head.y))
    mag: -> @magnitude()
    render: (world) ->
        end = [@head.x + @tail.x, @head.y + @tail.y]
        [tx, ty, hx, hy] = @tail.get()
                    .concat(end).map (n) -> n * world.unit
        world.line(tx, ty, hx, hy)
        
window.Vector = Vector
