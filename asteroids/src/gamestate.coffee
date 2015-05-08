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
        
        @ship = new Ship Points.SHIP, Points.FLAMES, ShipSize, @w / 2, @h / 2
        @ship.max.x = @w
        @ship.max.y = @h
        
        @level = 0
        
        @generateLevel()
    generateLevel: ->
        num = Math.round (@level + 5) / 10 + 2
        
        @ship.x = @w / 2
        @ship.y = @h / 2
        
        @bullets = []
        @asteroids = []
        for i in [0...num]
            a = Math.round Math.random() * (Points.ASTEROIDS.length - 1)
            x = 0
            y = 0
            if Math.random() > 0.5
                x = Math.round Math.random() * @w
            else
                y = Math.round Math.random() * @h
            astr = new Asteroid Points.ASTEROIDS[a], AsteroidSize, x, y
            astr.max.x = @w
            astr.max.y = @h
            @asteroids.push astr
    handleInputs: (input) ->
        rotateSpeed = 1/20
        @ship.drawFlames = false
        if input.isDown "up"
            @ship.addVel()
        if input.isDown "left"
            @ship.rotate(-rotateSpeed)
        if input.isDown "right"
            @ship.rotate(rotateSpeed)
        if input.isPressed "spacebar"
            @bullets.push @ship.shoot()
    update: ->
        ai = 0
        al = @asteroids.length
        while ai < al
            astr = @asteroids[ai]
            astr.update()
            bi = 0
            bl = @bullets.length
            while bi < bl
                b = @bullets[bi]
                if astr.hasPoint b.x, b.y
                    @bullets.splice(bi, 1)
                    bl = bl - 1
                    bi = bi - 1
                    
                    if astr.size > AsteroidSize/4
                        for k in [0...2]
                            ts = Points.ASTEROIDS.length - 1
                            a = Math.round Math.random() * ts
                            x = Math.round Math.random() * (@w - 1)
                            y = Math.round Math.random() * (@h - 1)
                            t = Points.ASTEROIDS[a]
                            mini = new Asteroid t, astr.size/2, astr.x, astr.y
                            mini.max.x = @w
                            mini.max.y = @h
                            @asteroids.push mini
                            al = al + 1
                        
                    @asteroids.splice ai, 1
                    al = al - 1
                    ai = ai - 1
                bi = bi + 1
            ai = ai + 1
        bi = 0
        bl = @bullets.length
        while bi < bl
            b = @bullets[bi]
            b.update()
            if b.omit
                @bullets.splice bi, 1
                bl = bl - 1
                bi = bi - 1
            bi = bi + 1
        @ship.update()
        
        if @asteroids.length is 0
            @level = @level + 1
            @generateLevel()
    render: (ctx) ->
        ctx.clear()
        astr.render ctx for astr in @asteroids
        b.render ctx for b in @bullets
        @ship.render ctx

@App.GameState = GameState
