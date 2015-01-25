require.config
    urlArgs: "nocache=" + (new Date).getTime()
    paths: 
        "jquery":     "../vendor/jquery/dist/jquery.min"
        "underscore": "../vendor/underscore/underscore"
        
require [
    "jquery", 
    "underscore"
], ($, _) ->
    $(document).ready ->
        console.log $
        console.log _
