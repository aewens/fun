require.config
    urlArgs: "nocache=" + (new Date).getTime()
    paths: 
        "jquery":     "../vendor/jquery.min"
        "underscore": "../vendor/underscore-min"
        
require [
    "jquery", 
    "underscore",
    "bool",
    "dom",
    "pappai"
], ($, _, Bool, Dom, Pappai) ->
    $(document).ready ->
        # Safe console.log
        log = console.info.bind(console)
        
        # Bool
        bool_test = (a, b, c) ->
            console.log a, b, c
            c.neg().f()
            Bool.fn.on(a + b, 3).run(log, c.t().neg())

        console.log Bool(bool_test, 1, 2)
        
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
