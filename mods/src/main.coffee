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
        DomCall = ->
            a = Dom.new()
            b = Dom.new()
            c = Dom.new()
            console.log a
            console.log b.create("div").into(document.body)
            console.log a.find("div").add(c.create("canvas"))
        
        # Pappai
        PappaiCall = ->
            p = Pappai.Node()
            q = Pappai.Circle(10)
            
            console.log p
            console.log(q.set(200, 100)
                         .fg("#fff")
                         .bg("#000")
                         .sg("#f00")
                         .link(p)
                         .render())
        
        setTimeout(DomCall, 0)
        setTimeout(PappaiCall, 1)
