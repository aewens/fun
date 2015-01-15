class Grid
    constructor: (world, w, h) ->
        @paint = world.paint
        @line = world.line
        @w = w
        @h = h
        @unit = pow(2,4)
    blocks: (unit) ->
        @unit = unit
    render: ->
        for y in [1..@h/@unit-1]
            yu = y * @unit
            @line(0, yu, @w, yu)
        for x in [1..@w/@unit-1]
            xu = x * @unit
            @line(xu, 0, xu, @h)
            
window.Grid = Grid
