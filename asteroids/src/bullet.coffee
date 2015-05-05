@App = window.App ? {}

class Bullet
    constructor: (@x, @y, angle) ->
        @vel =
            x: 5 * Math.cos angle
            y: 5 * Math.sin angle
    
        

@App.Bullet = Bullet
