@App = window.App ? {}

class Vector
    constructor: (@x, @y) ->
    grow: (s) ->
        new Vector(@x + s, @y + s)
    shrink: (s) ->
        new Vector(@x - s, @y - s)
    scale: (s) ->
        new Vector(@x * s, @y * s)
    compress: (s) ->
        new Vector(@x / s, @y / s)
    add: (v) ->
        new Vector(@x + v.x, @y + v.y)
    sub: (v) ->
        new Vector(@x - v.x, @y - v.y)
    norm: ->
        new Vector(@x / @mag(), @y / @mag())
    mag: ->
        Math.sqrt(@x * @x + @y * @y)
    dot: (v) ->
        @x * v.x + @y * v.y
    dot2: (u, v) ->
        u.x * v.x + u.y * v.y
    theta: (v) ->
        Math.acos(@dot2(@norm(), v.norm()))
