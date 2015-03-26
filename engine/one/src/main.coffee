require.config
    urlArgs: "nocache=" + (new Date).getTime()
        
require [
    "pappai"
], (Pappai) ->
    Pappai.Init(window.innerWidth, window.innerHeight)
    
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
    
    
