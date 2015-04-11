@App = window.App ? {}
State     = @App.State
GameState = @App.GameState
Canvas    = @App.Canvas

States = 
    NO_CHANGE: 0
    MENU: 1
    GAME: 2
    END: 3

class Game
    constructor: ->
        @canvas = new Canvas 640, 480
        
        @canvas.ctx.strokeStyle = "#fff"
        
        @currentState = null
        @nextState = States.GAME;
    run: ->
        self = @
        @canvas.animate ->
            if self.nextState isnt States.NO_CHANGE
                switch self.nextState
                    when States.MENU
                        self.currentState = new State self
                    when States.GAME
                        self.currentState = new GameState self
                    when States.END
                        self.currentState = new State self
                self.nextState = States.NO_CHANGE
            self.currentState.handleInputs()
            self.currentState.update()
            self.currentState.render self.canvas.ctx

game = new Game
game.run()
