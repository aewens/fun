@App = window.App ? {}
Polygon = @App.Polygon

class Asteroid extends Polygon
    constructor: (points, s, @x, @y) ->
        super points
        
        @size = s
        @max =
            x: null
            y: null
        
        @scale @size
        
        r = 2 * Math.PI * Math.random()
        v = Math.random() * 2 + 1
        @rotAngle = 0.02 * (Math.random() - 1)
        @vel =
            x: v * Math.cos r
            y: v * Math.sin r
    hasPoint: (x, y) ->
        super @x, @y, x, y
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
        
        @rotate @rotAngle
    render: (ctx) ->
        ctx.drawPoly @, @x, @y

@App.Asteroid = Asteroid
