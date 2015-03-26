define ["curry"], ($c) ->
    V = (x, y, z) ->
        new V.fn.init(x, y, z)
    V.fn = V.prototype =
        init: (x, y, z) ->
            @x = x || 0
            @y = y || 0
            @z = z || 0
            @type = "v"
            @
            
    V.fn.init.prototype = V.fn
        
    return V
