define ["curry"], ($c) ->
    P = (x, y, z) ->
        new P.fn.init(x, y, z)
    P.fn = P.prototype =
        init: (x, y, z) ->
            @x = x || 0
            @y = y || 0
            @z = z || 0
            @type = "p"
            @
        add: (vec) ->
            return @ if vec.type != "v"
            @x = @x + vec.x
            @y = @y + vec.y
            @z = @z + vec.z
            @
            
    P.fn.init.prototype = P.fn
        
    return P
