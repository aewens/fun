require.config
    urlArgs: "nocache=" + (new Date).getTime()
        
require [
    "engine",
    "pappai",
    "box",
    "formulae"
], (Engine, Pappai, Box, Formulae) ->
    ctx = Pappai.Init 960, 960 * 9/16, true
    canvas = ctx.canvas
    
    w = ctx.width
    h = ctx.height
    
    engine = new Engine ctx
        
    box1 = new Box 20, 20, 40, 40
    box2 = new Box 120, 20, 40, 40
    
    fnx = (i) ->
        i *= 5 * tau / @steps
        cos(i)
    fny = (i) ->
        i *= 5 * tau / 7
        sin(i)
        
    opts =
        doStroke: true
        noFill: true
    form = new Formulae(fnx,fny,7).grow(50).move(w/2,h/2).set(0,0)
    
    r = 2
    s = 0
    t = 0
    u = 0
    v = 0
    engine.animate ->
        ctx.clear()
        
        form.rotate(0.01)
        form.move(w/2 + u, h/2 + v)
        form.render(ctx, opts)
        box1.render "#f00"
        box2.render "#00f"
        s = (s + 1) % 50
        u = (u + r) if s % 3 is 0 and t is 0
        v = (v + r) if s % 3 is 0 and t is 1
        r = r * -1 if s is 0
        t = (t + 1) % 2 if s is 0 and r > 0
