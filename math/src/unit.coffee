# Unit Circle

class Unit
    constructor: (radius) ->
        @radius = radius
        @angle = 0
        @point = [0, 0]
    round: (x) -> +(round(x * 10000) / 10000)
    sin: (x) -> @round(sin(x))
    cos: (x) -> @round(cos(x))
    tan: (x) -> @round(tan(x))
    asin: (x) -> asin(x/@radius)
    acos: (x) -> acos(x/@radius)
    atan: (x) -> atan(x/@radius)
    rad: (deg) ->
        if deg is undefined
            @angle = @angle * tau / 360
        else
            @angle = deg * tau / 360
        @
    deg: (rad) ->
        if rad is undefined
            @angle = @angle * 360 / tau
        else
            @angle = rad * 360 / tau
        @
    use: (angle) ->
        @angle = angle
        @
    get: (rad) ->
        rad = @angle if rad is undefined
        x = @cos(rad)
        y = @sin(rad)
        @point = [x, y]
        @
    scale: (mag) ->
        mag = @radius if mag is undefined
        @point = @point.map (x) -> x * mag
        @
        
window.Unit = Unit 
