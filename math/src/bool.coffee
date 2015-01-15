B = (fn, args...) ->
    new B.init(fn, args)
B.init = (fn, args) ->
    @val = false
    args.push(@)
    fn.apply(@, args)
    @
B.fn = B.prototype =
    on: (value, expect) ->
        @t() if value is expect
        @
    run: (fn, args...) ->
        if @val then fn.apply(null, args)
    neg: -> 
        @val = !@val
        @
    t: -> 
        @val = true
        @
    f: ->
        @val = false
        @
    
B.init.prototype = B.fn
    
f = (a, b, c) ->
    c.neg().f()
    B.fn.on(a + b, 3).run(console.log, c.t().neg())

B(f, 1, 2)
