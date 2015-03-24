require.config
    urlArgs: "nocache=" + (new Date).getTime()
    paths: 
        "jquery":     "../vendor/jquery.min"
        
require [
    "jquery",
    "bool",
    "dom",
    "pappai"
], ($, Bool, Dom, Pappai) ->
    $(document).ready ->
        # Create canvas
        Dom.create("div").into(document.body)
        Dom.find("div").add(Dom.create("canvas"))
        
        # Pappai
        pn = Pappai.Node()
        pc = Pappai.Circle(10)
        pb = Pappai.Box(30,12)
        ps = Pappai.Square(20)
        
        (pc.set(200, 100)
                     .fg("#fff")
                     .bg("#000")
                     .sg("#f00")
                     .link(pn)
                     .render())
        (pb.set(100, 100)
                     .fg("#fff")
                     .bg("#000")
                     .sg("#f00")
                     .link(pc)
                     .render())
        (ps.set(100, 10)
                     .fg("#fff")
                     .bg("#000")
                     .sg("#f00")
                     .link(pb)
                     .render())
