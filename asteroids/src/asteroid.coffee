@App = window.App ? {}
Polygon = @App.Polygon

class Asteroid extends Polygon
    constructor: (points, s, @x, @y) ->
        super points
        
        @scale s
        
        r = 2 * Math.PI * Math.random()
        v = Math.random() * 4 + 1
        @vel =
            x: v * Math.cos r
            y: v * Math.sin r
    render: (ctx) ->
        ctx.drawPoly @, @x, @y

@App.Asteroid = Asteroid
