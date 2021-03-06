# Paper & Paint
# Depends on dom.coffee
define ["dom"], ($) ->
    class CNode
        constructor: ->    
            @PAPER = $.get("#pappai")
            @PAINT = @PAPER.getContext("2d")
            @x = 0
            @y = 0
            @xx = 0
            @yy = 0
            @fcolor = "#000"
            @bcolor = "#fff"
            @scolor = "#000"
        give: (k, v) ->
            @[k] = v
            @
        get: (k) -> @[k]
        mid: (x, y) -> [x, y]
        set: (x, y) ->
            @x = x
            @y = y
            xy = @mid(x, y)
            @xx = xy[0]
            @yy = xy[1]
            @
        fg: (color) ->
            @fcolor = color || @fcolor
            @
        bg: (color) ->
            @bcolor = color || @bcolor
            @
        sg: (color) ->
            @scolor = color || @scolor
            @
        line: (xa, ya, xb, yb) ->
            @PAINT.beginPath()
            @PAINT.moveTo(xa, ya)
            @PAINT.lineTo(xb, yb)
            @PAINT.closePath()
            @PAINT.strokeStyle = @scolor
            @PAINT.stroke()
        link: (node) ->
            @line(@xx, @yy, node.xx, node.yy) if node instanceof CNode
            @
    
    class CCircle extends CNode
        constructor: (Pappai, radius) ->
            @give("radius", radius)
            @give("pi", Math.PI)
            @give("tau", 2 * Math.PI)
            super
        mid: (x, y) -> [x, y]
        render: ->
            @PAINT.closePath()
            @PAPER.style.backgroundColor = @bcolor
            @PAINT.fillStyle = @fcolor
            @PAINT.arc(@x, @y, @radius, 0, @tau)
            @PAINT.fill()
            @
            
    class CBox extends CNode
        constructor: (Pappai, width, height) ->
            @give("width", width)
            @give("height", height)
            super
        mid: (x, y) ->
            [
                x + (@width/2),
                y + (@height/2)
            ]
        render: ->
            @PAINT.closePath()
            @PAPER.style.backgroundColor = @bcolor
            @PAINT.fillStyle = @fcolor
            @PAINT.rect(@x, @y, @width, @height)
            @PAINT.fill()
            @
            
    class CSquare extends CNode
        constructor: (Pappai, side) ->
            @give("side", side)
            super
        mid: (x, y) ->
            [
                x + (@side/2),
                y + (@side/2)
            ]
        render: ->
            @PAINT.closePath()
            @PAPER.style.backgroundColor = @bcolor
            @PAINT.fillStyle = @fcolor
            @PAINT.fillRect(@x, @y, @side, @side)
            @PAINT.fill()
            @
    
    Pappai =
        Init: (width, height, theater) ->
            canvas = $.create("canvas", "pappai").into(document.body)
            if theater
                $.find("html").css({
                    "margin": 0
                    "padding": 0
                })
                $.find("body").css({
                    "margin": 0
                    "padding": 0
                })
                canvas.attr.set("width",  window.innerWidth)
                      .attr.set("height", window.innerHeight)
            else
                
                canvas.attr.set("width",  width)
                      .attr.set("height", height)
        Node: -> new CNode()
        Circle: (radius) -> new CCircle(@, radius)
        Box: (width, height) -> new CBox(@, width, height)
        Square: (side) -> new CSquare(@, side)
            
    return Pappai
