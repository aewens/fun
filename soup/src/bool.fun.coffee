B = ->
    proto = 
        using: (fn) -> 
            @init = fn
            @
        with: (obj) -> 
            @proto = obj
            @
        make: ->
            self = @
            F = (args) ->
                self.init.apply(this, args)
            F.prototype = B.fn = self.proto
            return -> new F(arguments)
    Object.create(proto)
    
f = (a, b, c) ->
    c.neg().f()
    B.fn.on(a + b, 3).run(console.log, c.t().neg())

init = (fn, args...) ->
    @val = false
    args.push(@)
    fn.apply(@, args)
    @
    
proto = 
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

B().using(init).with(proto).make()(f, 1, 2)
