require.config
    urlArgs: "nocache=" + (new Date).getTime()
    paths: 
        "jquery":     "../vendor/jquery.min"
        "underscore": "../vendor/underscore-min"
        
require [
    "jquery", 
    "underscore",
    "dom"
], ($, _, Dom) ->
    $(document).ready ->
        a = Dom.new()
        b = Dom.new()
        c = Dom.new()
        console.log a
        console.log b.create("div").into(document.body)
        console.log a.find("div").add(c.create("canvas"))
