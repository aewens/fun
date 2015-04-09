@App = window.App ? {}
$ = @App.$
Pappai = @App.Pappai

# Initialize the setup
Pappai.Init(500, 200, true)

# Get window size
ww = window.innerWidth
wh = window.innerHeight
cw = ww / 2
ch = wh / 2

factors = (x) ->
    f = []
    q = 0
    for i in [1...x]
        q = x/i
        f.push(i) if q is Math.floor(q)
    f
gcd = (x, y) ->
    return x unless y
    return gcd(y, x % y)
# max = (x) -> Math.max.apply(Math, x)
# fit = (x, y) ->
#     a = factors(x)
#     b = factors(y)
#     c = a.filter (n) -> b.indexOf(n) != -1
#     max(c)

# Initialize pappai nodes
pn = []
pa = gcd(ww,wh)
console.log pa
for quux in new Array(pa * 4)
    pn.push Pappai.Node()
    
# Set pappai nodes in the four side midpoints
for i in [0...pa]
    pn[i].set(0, i * (ww/pa))
    pn[i+pa].set(ww, i * (ww/pa))
for j in [0...pa] by 2
    pn[j+pa*2].set(j * (wh/pa), 0)
    pn[j+pa*3].set(j * (wh/pa), wh)
    
for k in [0...pa]
    pn[k].link(pn[k+pa])
    pn[k+pa*2].link(pn[k+pa*3])

# # Link them into two axises in center
# pn[0].link(pn[1])
# pn[2].link(pn[3])

# # Set origin point
# origin = Pappai.Circle(4)
# origin.set(cw, ch).render()

point = (x, y) ->
    new point.init(x, y)
point.init = (x, y) ->
    @x = x
    @y = y
    @
point.prototype =
    to: (p) ->
        vec2((p.x - @x), (p.y - @y)).at(@)
point.init.prototype = point.prototype
    
vec2 = (x, y) ->
    new vec2.init(x, y)
vec2.init = (x, y) ->
    @x = x
    @y = y
    @ox = 0
    @oy = 0
    @
vec2.prototype =
    at: (p) ->
        @ox = p.x
        @oy = p.y
        @
    mag: ->
        Math.sqrt((@x * @x) + (@y * @y))
    head: -> [@x, @y]
    tail: -> [@ox, @oy]
vec2.init.prototype = vec2.prototype

console.log vec2(2, 3).tail()
console.log point(0, 0).to(point(2, 3))

# v0 = vec2(2, 3)
# pv0 = Pappai.Circle(4).set(cw + (v0.x * 10), ch - (v0.y * 10)).render()
# origin.link(pv0)
    
# # Pappai
# pn = Pappai.Node()
# pc = Pappai.Circle(10)
# pb = Pappai.Box(30,12)
# ps = Pappai.Square(20)
# 
# (pc.set(200, 100)
#              .fg("#fff")
#              .bg("#000")
#              .sg("#f00")
#              .link(pn)
#              .render())
# (pb.set(100, 100)
#              .fg("#fff")
#              .bg("#000")
#              .sg("#f00")
#              .link(pc)
#              .render())
# (ps.set(100, 10)
#              .fg("#fff")
#              .bg("#000")
#              .sg("#f00")
#              .link(pb)
#              .render())
# 
# 
