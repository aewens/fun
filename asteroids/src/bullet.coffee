@App = window.App ? {}

class Bullet
    constructor: (@x, @y, angle) ->
        @omit = false
        @vel =
            x: 5 * Math.cos angle
            y: 5 * Math.sin angle
        @max =
            x: null
            y: null
    update: ->
        @prevX = @x
        @prevY = @y
        @omit = true if @x < 0 or @x >= @max.x or @y < 0 or @y >= @max.y
        @x = @prevX + @vel.x
        @y = @prevY + @vel.y
    render: (ctx) ->
        ctx.beginPath()
        ctx.moveTo @prevX, @prevY
        ctx.lineTo @x, @y
        ctx.stroke()
        ctx.closePath()

@App.Bullet = Bullet
