@App = window.App ? {}
State    = @App.State
Asteroid = @App.Asteroid

Points = {
    ASTEROIDS: [
        [-4,-2,-2,-4,0,-2,2,-4,4,-2,3,0,4,2,1,4,-2,4,-4,2,-4,-2]
    ,   [-3,0,-4,-2,-2,-4,0,-3,2,-4,4,-2,2,-1,4,1,2,4,-1,3,-2,4,-4,2,-3,0]
    ,   [-2,0,-4,-1,-1,-4,2,-4,4,-1,4,1,2,4,0,4,0,1,-2,4,-4,1,-2,0]
    ,   [-1,-2,-2,-4,1,-4,4,-2,4,-1,1,0,4,2,2,4,1,3,-2,4,-4,1,-4,-2,-1,-2]
    ,   [-4,-2,-2,-4,2,-4,4,-2,4,2,2,4,-2,4,-4,2,-4,-2]
    ]
}

class GameState extends State
    constructor: (game) ->
        super game
        
        @generateLevel()
    generateLevel: ->
        num = 3
        
        w = @game.canvas.ctx.width
        h = @game.canvas.ctx.height
        @asteroids = []
        for i in [0...num]
            a = Math.round Math.random() * (Points.ASTEROIDS.length - 1)
            x = Math.round Math.random() * (w - 1)
            y = Math.round Math.random() * (h - 1)
            astr = new Asteroid Points.ASTEROIDS[a], 10, x, y
            astr.max.x = w
            astr.max.y = h
            @asteroids.push astr
    update: ->
        astr.update() for astr in @asteroids
    render: (ctx) ->
        ctx.clear()
        astr.render ctx for astr in @asteroids

@App.GameState = GameState
