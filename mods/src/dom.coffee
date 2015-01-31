define ->
    $ =
        create: (el) ->
            @el = document.createElement(el)
            @
        isElem: (el) ->
            el instanceof HTMLElement
        into: (el) ->
            unless el and @el
                console.log "Error #001: el(#{el}), @el(#{@el}))"
                return
            el.appendChild(@el) if @isElem(el)
            @
            
    return $
