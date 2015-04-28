@App = window.App ? {}
State    = @App.State
Asteroid = @App.Asteroid
Ship     = @App.Ship

Points = {
    ASTEROIDS: [
        [-4,-2,-2,-4,0,-2,2,-4,4,-2,3,0,4,2,1,4,-2,4,-4,2,-4,-2]
    ,   [-3,0,-4,-2,-2,-4,0,-3,2,-4,4,-2,2,-1,4,1,2,4,-1,3,-2,4,-4,2,-3,0]
    ,   [-2,0,-4,-1,-1,-4,2,-4,4,-1,4,1,2,4,0,4,0,1,-2,4,-4,1,-2,0]
    ,   [-1,-2,-2,-4,1,-4,4,-2,4,-1,1,0,4,2,2,4,1,3,-2,4,-4,1,-4,-2,-1,-2]
    ,   [-4,-2,-2,-4,2,-4,4,-2,4,2,2,4,-2,4,-4,2,-4,-2]
    ]
    SHIP: [-2,0,-3,-3,6,0,-3,3,-2,0]
    FLAMES: [-2,0,-3,-1,-5,0,-3,1,-2,0]
}

AsteroidSize = 8
ShipSize     = 2

class GameState extends State
    constructor: (game) ->
        super game
        
        @w = @game.canvas.ctx.width
        @h = @game.canvas.ctx.height
        
        @ship = new Ship Points.SHIP, ShipSize, @w / 2, @h / 2
        @ship.max.x = @w
        @ship.max.y = @h
        
        @generateLevel()
    generateLevel: ->
        num = 3
        
        @asteroids = []
        for i in [0...num]
            a = Math.round Math.random() * (Points.ASTEROIDS.length - 1)
            x = Math.round Math.random() * (@w - 1)
            y = Math.round Math.random() * (@h - 1)
            astr = new Asteroid Points.ASTEROIDS[a], AsteroidSize, x, y
            astr.max.x = @w
            astr.max.y = @h
            @asteroids.push astr
    handleInputs: (input) ->
        rotateSpeed = 1/20
        if input.isDown "up"
            @ship.addVel()
        if input.isDown "down"
            @ship.addVel()
        if input.isDown "left"
            @ship.rotate(-rotateSpeed)
        if input.isDown "right"
            @ship.rotate(rotateSpeed)
        # if input.isDown "spacebar"
    update: ->
        astr.update() for astr in @asteroids
        @ship.update()
    render: (ctx) ->
        ctx.clear()
        astr.render ctx for astr in @asteroids
        @ship.render ctx

@App.GameState = GameState
