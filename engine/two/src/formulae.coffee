define ->
    class Formulae
        constructor: (@fnx, @fny, @steps) ->
            @scale = 0
            @shift =
                x: 0
                y: 0
        scale: (@scale) ->
        shift: (x, y) ->
            @shift.x = x
            @shift.y = y
        set: (@x, @y) ->
        render: -> # Black Magic™
        

    return Formulae

# Formulae is a recursive system of feeding in an amount of steps and starting 
# x/y passed into their respective function until the steps are completed

# Formulae uses a subset of Pappai's CNode functionality to quickly access
# control of the canvas in a user-friendly manner using Black Magic™

# Example:
# fnx = (i) ->
#   i *= 5 * tau / @steps
#   cos(i) * @scale + @shift.x
# fny = (i) ->
#   i *= 5 * tau / 7
#   sin(i) * @scale + @shift.y
# 
# new Formulae(fnx,fny,7).scale(50).shift(w/2,h/2).set(0,0).render()

# This will render a seven point star scaled by 50 in the middle of the screen
