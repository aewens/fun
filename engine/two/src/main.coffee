require.config
    urlArgs: "nocache=" + (new Date).getTime()
        
require [
    "engine",
    "pappai",
    "box"
], (Engine, Pappai, Box) ->
    ctx = Pappai.Init 960, 960 * 9/16, true
    canvas = ctx.canvas
    
    engine = new Engine ctx
        
    box1 = new Box 20, 20, 40, 40
    box2 = new Box 120, 20, 40, 40
    engine.animate ->
        ctx.clear()
        
        box1.render "#f00"
        box2.render "#00f"
