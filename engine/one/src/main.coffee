require.config
    urlArgs: "nocache=" + (new Date).getTime()
        
require [
    "pappai"
], (Pappai) ->
    Pappai.Init(500, 200, true)
    
    wx = window.innerWidth
    wh = window.innerHeight
    
    pn = []
    for _ in new Array(4)
        pn.push Pappai.Node()
        
    pn[0].set(0,  wh / 2)
    pn[1].set(wx, wh / 2)
    pn[2].set(wx / 2,  0)
    pn[3].set(wx / 2, wh)
    
    pn[0].link(pn[1])
    pn[2].link(pn[3])
    
    origin = Pappai.Circle(4)
    origin.set(wx / 2, wh / 2).render()
        
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
