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
        console.log Dom
        console.log Dom.create("div").into(document.body)
