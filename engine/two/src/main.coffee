require.config
    urlArgs: "nocache=" + (new Date).getTime()
        
require [
    "pappai",
    "box"
], (Pappai, Box) ->
    ctx = Pappai.Init(960, 960 * 9/16, true)
    canvas = ctx.canvas
    
    animate = (leup) ->
        rf = (-> window.requestAnimationFrame)()
        l = ->
            leup()
            rf l, canvas
        rf l, canvas
        
    box1 = new Box 20, 20, 40, 40
    box2 = new Box 120, 20, 40, 40
    animate ->
        ctx.clear()
        
        box1.render("#f00")
        box2.render("#00f")
