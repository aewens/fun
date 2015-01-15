class World
    constructor: ->
        @paper = document.querySelector("#paper")
        @paint = @paper.getContext("2d")
        mod = pow(2, 2)
        @ratio = [mod * 4, mod * 3]
        @unit  = @resize(@ratio[0], @ratio[1])
    
    resize: (r0, r1) ->
        w = parseInt window.innerWidth
        h = parseInt window.innerHeight
        r2 = r1/r0
        
        binr = (n) -> pow(2, floor(log(n)/log(2)))
        hone = (a, b, c, r) ->
            if a > c
                if b > c*r then [c, c*r]
                else hone(a, b, c * r, r)
            else hone(a, b, c * r, r)
        
        k = [
            (if r0 > r1 then w else h),
            (if r0 > r1 then h else w)
        ]
        q = binr(k[0])
        p = hone(k[0], k[1], q, r2)
        x = p[(if r0 > r1 then 0 else 1)]
        y = p[(if r0 > r1 then 1 else 0)]
        r = min(r0, r1)
        s = max(x, y)
        
        unit0 = binr(floor(s/r))
        unit1 = binr(floor(s/(r+1)))
        unit  = (unit0 + unit1) / 2
        
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
v1 = new Vector(3,5).set(2,2).mult(2)
v2 = new Vector(5,-3).set(v1)
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
