define ->
    autocurry = (->
        to_a = (a, f) -> Array.prototype.slice.call(a, f || 0)
        curry = (fn) ->
            args = to_a(arguments, 1)
            -> fn.apply(@, args.concat(to_a(arguments)))
        
        autocurry = (fn, n) ->
            n = n || fn.length
            -> 
                l = arguments.length
                if l < n
                    if n - l > 0
                        autocurry(curry.apply(@, 
                        [fn].concat(to_a(arguments)), n - l))
                    else
                        curry.apply(@, [fn].concat(to_a(arguments)))
                else
                    fn.apply(@, arguments)
    )()
    
    return autocurry
    # curry = (fn) -> ->
    #     return fn if arguments.length < 1
    #     to_a = (a) -> Array.prototype.slice.call(a)
    #     args = to_a(arguments)
    #     -> fn.apply(@, args.concat(to_a(arguments)))
