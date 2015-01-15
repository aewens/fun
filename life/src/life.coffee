class Life
    constructor: ->
        @paper = document.querySelector("#paper")
        @paint = @paper.getContext("2d")
        mod = pow(2, 2)
        @ratio = [mod * 4, mod * 3]
        @unit  = @resize(@ratio[0], @ratio[1])
    
    resize: (r0, r1) ->
        w = parseInt window.getComputedStyle(document.body).width
        h = parseInt window.getComputedStyle(document.body).height
        
        x = min(w,h)
        y = min(r0,r1) + 1
        
        # unit = pow(2,((floor(log(floor(x/y))/log(2)))))
        unit = floor(x/y)
        
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
            
life = new Life
cells = new Cells(life.paper, life.unit, life.ratio[0], life.ratio[1])
alive = cells.alive
paper = life.paper
paint = life.paint
    
render = ->
    paint.clearRect(0, 0, paper.width, paper.height)
    cells.next_gen()
    
# setInterval(render, 100)

# Speed-mode!
# cells.animate(render)
