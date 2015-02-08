require.config
    urlArgs: "nocache=" + (new Date).getTime()
    paths: 
        "jquery":     "../vendor/jquery.min"
        "underscore": "../vendor/underscore-min"
        
require [
    "jquery", 
    "underscore",
    "dom",
    "pappai"
], ($, _, Dom, Pappai) ->
    $(document).ready ->
        # Dom
        a = Dom.new()
        b = Dom.new()
        c = Dom.new()
        console.log a
        console.log b.create("div").into(document.body)
        console.log a.find("div").add(c.create("canvas"))
        
        # Pappai
        pn = Pappai.Node()
        pc = Pappai.Circle(10)
        pb = Pappai.Box(10,6)
        ps = Pappai.Square(8)
        
        console.log pn
        console.log(pc.set(200, 100)
                     .fg("#fff")
                     .bg("#000")
                     .sg("#f00")
                     .link(pn)
                     .render())
        console.log(pb.set(100, 100)
                     .fg("#fff")
                     .bg("#000")
                     .sg("#f00")
                     .link(pc)
                     .render())
        console.log(ps.set(100, 10)
                     .fg("#fff")
                     .bg("#000")
                     .sg("#f00")
                     .link(pb)
                     .render())
