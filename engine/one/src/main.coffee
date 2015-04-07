require.config
    urlArgs: "nocache=" + (new Date).getTime()
        
require [
    "pappai"
], (Pappai) ->
    # Initialize the setup
    Pappai.Init(500, 200, true)
    
    # Get window size
    ww = window.innerWidth
    wh = window.innerHeight
    cw = ww / 2
    ch = wh / 2
    
    # Initialize pappai nodes
    pn = []
    for _ in new Array(4)
        pn.push Pappai.Node()
        
    # Set pappai nodes in the four side midpoints
    pn[0].set(0,  ch)
    pn[1].set(ww, ch)
    pn[2].set(cw,  0)
    pn[3].set(cw, wh)
    
    # Link them into two axises in center
    pn[0].link(pn[1])
    pn[2].link(pn[3])
    
    # Set origin point
    origin = Pappai.Circle(4)
    origin.set(cw, ch).render()
    
    point = (x, y) ->
        new point.init(x, y)
    point.init = (x, y) ->
        @x = x
        @y = y
        @
    point.prototype =
        to: (p) ->
            vec2((p.x - @x), (p.y - @y)).at(@)
    point.init.prototype = point.prototype
        
    vec2 = (x, y) ->
        new vec2.init(x, y)
    vec2.init = (x, y) ->
        @x = x
        @y = y
        @ox = 0
        @oy = 0
        @
    vec2.prototype =
        at: (p) ->
            @ox = p.x
            @oy = p.y
            @
        mag: ->
            Math.sqrt((@x * @x) + (@y * @y))
        head: -> [@x, @y]
        tail: -> [@ox, @oy]
    vec2.init.prototype = vec2.prototype
    
    console.log vec2(2, 3).tail()
    console.log point(0, 0).to(point(2, 3))
    
    v0 = vec2(2, 3)
    pv0 = Pappai.Circle(4).set(cw + (v0.x * 10), ch - (v0.y * 10)).render()
    origin.link(pv0)
        
    # # Pappai
    # pn = Pappai.Node()
    # pc = Pappai.Circle(10)
    # pb = Pappai.Box(30,12)
    # ps = Pappai.Square(20)
    # 
    # (pc.set(200, 100)
    #              .fg("#fff")
    #              .bg("#000")
    #              .sg("#f00")
    #              .link(pn)
    #              .render())
    # (pb.set(100, 100)
    #              .fg("#fff")
    #              .bg("#000")
    #              .sg("#f00")
    #              .link(pc)
    #              .render())
    # (ps.set(100, 10)
    #              .fg("#fff")
    #              .bg("#000")
    #              .sg("#f00")
    #              .link(pb)
    #              .render())
    # 
    # 
