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
        
        a = Math.round Math.random() * (Points.ASTEROIDS.length - 1)
        @astr = new Asteroid Points.ASTEROIDS[a], 10, 100, 100
    update: ->
        @astr.rotate 0.01
    render: (ctx) ->
        ctx.clear()
        @astr.render ctx

@App.GameState = GameState
