@App = window.App ? {}
Polygon = @App.Polygon

class Ship extends Polygon
    constructor: (points, s, @x, @y) ->
        super points
        
        @max =
            x: null
            y: null
        
        @scale s
        
        @angle = 0
        
        @vel =
            x: 0
            y: 0
    addVel: ->
        speed = 1/20
        if Math.sqrt(@vel.x*@vel.x + @vel.y*@vel.y) < 20
            @vel.x = @vel.x + speed * Math.cos @angle
            @vel.y = @vel.y + speed * Math.sin @angle
    rotate: (theta) ->
        super theta
        
        @angle = @angle + theta
    update: ->
        @x = @x + @vel.x
        @y = @y + @vel.y
        
        friction = 0.99
        
        @vel.x = @vel.x * friction
        @vel.y = @vel.y * friction
        
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
