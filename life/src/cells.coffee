class Cells
    constructor: (paper, unit, x, y) ->
        @x = x
        @y = y
        @u = unit
        @p = paper.getContext("2d")
        @paper = paper
        @pop = @x * @y
        @alive = @generate()
        
    xy: (a) ->
        x = a % @x
        y = div(a, @x)
        [x,y]
        
    generate: ->
        alive = new Array(@pop)
        chance = 0.85
        for a in [0..@pop-1]
            alive[a] = (random() > chance)
            if alive[a]
                [x, y] = @xy(a)
                @draw_cell(x, y)
        alive
            
    draw_cell: (x, y) ->
        if (x >= @x) then x = 0
        if (y >= @y) then y = 0
        if (x <   0) then x = @x-1
        if (y <   0) then y = @y-1
        @p.fillRect(x * @u, y * @u, @u, @u)
        
    neighbors: (x, y) ->
        count = 0
        if @alive[(x-1) + (y-1) * @x] then count = count + 1
        if @alive[(x+1) + (y-1) * @x] then count = count + 1
        if @alive[(x)   + (y-1) * @x] then count = count + 1
        if @alive[(x-1) + (y)   * @x] then count = count + 1
        if @alive[(x+1) + (y)   * @x] then count = count + 1
        if @alive[(x-1) + (y+1) * @x] then count = count + 1
        if @alive[(x+1) + (y+1) * @x] then count = count + 1
        if @alive[(x)   + (y+1) * @x] then count = count + 1
        count
        
    next_gen: ->
        for a in [0..@pop-1]
            [x, y] = @xy(a)
            ns = @neighbors(x, y)
            alive = @alive[a]
            @alive[a] = false
            if alive
                if ns is 2 or ns is 3
                    @alive[a] = true
                    @draw_cell(x, y)
            else
                if ns is 3
                    @alive[a] = true
                    @draw_cell(x, y)
        
    animate: (render) ->
        self = @
        rf = (x,y) -> window.requestAnimationFrame(x,y)
        l = ->
            render()
            rf l, self.paper
        rf l, @paper
    
window.Cells = Cells
