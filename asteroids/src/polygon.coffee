@App = window.App ? {}

class Polygon
    constructor: (points) ->
        @points = points.slice 0
    rotate: (theta) ->
        cos = Math.cos theta
        sin = Math.sin theta
        
        for i in [0...@points.length] by 2
            x = @points[i]
            y = @points[i+1]
            
            @points[i] = cos * x - sin * y
            @points[i+1] = sin * x + cos * y
    scale: (c) ->
        @points[i] = @points[i] * c for i in [0...@points.length]
    hasPoint: (ox, oy, x, y) ->

@App.Polygon = Polygon
