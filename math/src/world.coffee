class World
    constructor: ->
        @paper = document.querySelector("#paper")
        @paint = @paper.getContext("2d")
        mod = pow(2, 2)
        @ratio = [mod * 4, mod * 3]
        @unit  = @resize(@ratio[0], @ratio[1])
    
    resize: (r0, r1) ->
        w = parseInt window.getComputedStyle(document.body).width
        h = parseInt window.getComputedStyle(document.body).height
        
        binr = (n) -> pow(2,floor(log(n)/log(2)))
        
        x = binr(max(w,h)) * (r1 / r0)
        y = x * (r1 / r0)
        r = min(r0, r1)
        
        unit0 = binr(floor(x/r))
        unit1 = binr(floor(x/(r+1)))
        unit  = (unit0 + unit1) / 2
        # unit = floor(x/y)
        
        @paper.width  = unit * r0
        @paper.height = unit * r1
        
        m0 = (h - @paper.height) / 2
        m1 = (w - @paper.width)  / 2
        
        @paper.style.margin = "#{m0}px #{m1}px"
        
        unit
        
    line: (x0, y0, x1, y1) ->
        @paint.beginPath()
        @paint.moveTo(x0, y0)
        @paint.lineTo(x1, y1)
        @paint.closePath()
        @paint.stroke()
            
world = new World
paper = world.paper
paint = world.paint
pw = paper.width
ph = paper.height
grid = new Grid(world, pw, ph)
grid.blocks(world.unit)
v1 = new Vector(3,5).set(2,2)
v2 = new Vector(7,-2).set(v1)
v3 = v1.add(v2)
    
render = ->
    paint.clearRect(0, 0, pw, ph)
    grid.render()
    v1.render(world)
    v2.render(world)
    v3.render(world)
    
render()
# setInterval(render, 100)

# Speed-mode!
# cells.animate(render)
