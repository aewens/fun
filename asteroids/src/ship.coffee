@App = window.App ? {}
Polygon = @App.Polygon

class Ship extends Polygon
    constructor: (points, s, @x, @y) ->
        super points
        
        @max =
            x: null
            y: null
        
        @scale s
        
        @vel =
            x: 0
            y: 0
    update: ->
        @x = @x + @vel.x
        @y = @y + @vel.y
        
        if @x > @max.x
            @x = 0 
        else if @x < 0
            @x = @max.x
        if @y > @max.y
            @y = 0 
        else if @y < 0
            @y = @max.y
    render: (ctx) ->
        ctx.drawPoly @, @x, @y


@App.Ship = Ship
