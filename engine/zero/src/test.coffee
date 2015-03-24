# Micro Test Framework
_tests = []
_fails = 0
_deter = -> # put your determination function here
expect = (a) -> 
    a: a
    to: (b) ->
        determ = _deter(a, b)
        if determ
            _tests.push(true)
        else
            _tests.push(false)
            console.log "Test(#{_tests.length}) failed: (#{a})[#{b}]"
            _fails = _fails + 1
            
results = ->
    console.log "Passed: #{_tests.length - _fails}/#{_tests.length}"
    if _fails is 0 then console.log "All passed!"
