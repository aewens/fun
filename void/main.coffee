_tests = []
check = (res, expect) -> _tests.push [res is expect, res, expect]
determ = ->
    passed = 0
    for t in _tests
        if t
            passed = passed + 1
        else
            console.log "#{i}: #{_tests[t][1]} #{_tests[t][2]}"
    console.log "---"
    console.log "#{passed}/#{_tests.length} passed"

ffi =
    i: (f) -> f((n) -> n + 1)(0)
    b: (f) -> f(true)(false)
    a: (p) ->
        arr = []
        until ffi.b(_.null(p))
            arr.push(_.head(p))
            p = _.rest(p)
        p
        
_ = {}

# SKI Combinators
_.i = (x) -> x
_.k = (x) -> (y) -> x
_.s = (x) -> (y) -> (z) -> x(z)(y(z))

# Iota Combinator
_.x = (x) -> x(_.s(_.k))

# Fixed-Point Combinators
_.Y = (g) -> ((f) -> f(f))((f) -> g(((x) -> (f(f))(x))))
_.Z = (f) -> ((x) -> f((y) -> x(x)(y)))((x) -> f((y) -> x(x)(y)))

# Logic Operators
_.iff = (p) -> p
_.t   = (x) -> (y) -> x
_.f   = (x) -> (y) -> y
_.and = (p) -> (q) -> p(q)(p)
_.or  = (p) -> (q) -> p(p)(q)
_.not = (p) -> p(_.f)(_.t)
_.xor = (p) -> (q) -> p(_.not(q))(q)

# List Operators
_.pair = (x) -> (y) -> (f) -> f(x)(y)
_.car  = (p) -> p(_.t)
_.cdr  = (p) -> p(_.f)
# _.nil  = (x) -> _.t
# _.null = (p) -> p((x) -> (y) -> _.f)
_.nil  = _.pair(_.t)(_.t)
_.null = _.car
_.cons = (p) -> (x) -> _.pair(_.f)(_.pair(x)(p))
_.head = (p) -> _.car(_.cdr(p))
_.tail = (p) -> _.cdr(_.cdr(p))

# Compare Operators
_.is0 = (n) -> n((x) -> _.f)(_.t)
_.leq = (m) -> (n) -> _.is0(_.sub(m)(n))
_.geq = (m) -> (n) -> _.leq(n)(m)
_.neq = (m) -> (n) -> _.or(_.not(_.leq(m)(n)))(_.not(_.leq(n)(m)))
_.eq  = (m) -> (n) -> _.and(_.leq(m)(n))(_.leq(n)(m))
_.lt  = (m) -> (n) -> _.not(_.leq(n)(m))
_.gt  = (m) -> (n) -> _.not(_.leq(m)(n))

# Math Operators
_.succ = (n) -> (f) -> (x) -> f(n(f)(x))
_.pred = (n) -> (f) -> (x) -> n((g) -> (h) -> h(g(f)))((u) -> x)((u) -> u)
_.add  = (m) -> (n) -> n(_.succ)(m)
_.sub  = (m) -> (n) -> n(_.pred)(m)
_.mul  = (m) -> (n) -> (f) -> m(n(f))
_.pow  = (b) -> (e) -> e(b)
_.div1 = (g) -> (q) -> (a) -> (b) -> 
    # if(a < b) then [q, a] else div1(q+1, a-b, b)
    _.iff(_.lt(a)(b))(_.pair(q)(a))((x) -> g(_.succ(q))(_.sub(a)(b))(b)(x))
_.div  = (a) -> (b) -> _.Z(_.div1)(_[0])(a)(b)
_.idiv = (m) -> (n) -> _.car(_.div(m)(n))
_.mod  = (m) -> (n) -> _.cdr(_.div(m)(n))

# Numbers
_[0] = (f) -> (x) -> x
_[1] = _.succ(_[0])
_[2] = _.succ(_[1])
_[3] = _.succ(_[2])
_[4] = _.succ(_[3])
_[5] = _.succ(_[4])
_[6] = _.succ(_[5])
_[10] = _.mul(_[2])(_[5])
_[15] = _.mul(_[3])(_[5])
_[100] = _.mul(_[10])(_[10])

# # Cons shell for testing
# shell = _.cons(_[0])(_.cons(_[1])(_.nil))
# check(ffi.i(_.car(shell)), 0)
# check(ffi.i(_.car(_.cdr(shell))), 1)

# Cons shell for testing
shell = _.cons(_.cons(_.nil)(_[1]))(_[0])
check(ffi.i _.head(shell), 0)
check(ffi.i _.head(_.tail(shell)), 1)

check(_.i(_.s(_.k)(_.k)(1)), 1)
check(_.x(_.x)(1), 1)
check(ffi.i(_[0]), 0)
check(ffi.i(_[1]), 1)
check(ffi.i(_[2]), 2)
check(ffi.i(_.pred(_[2])), 1)
check(ffi.i(_.add(_[3])(_[1])), 4)
check(ffi.i(_.sub(_[3])(_[1])), 2)
check(ffi.i(_.mul(_[2])(_[3])), 6)
check(ffi.i(_.pow(_[2])(_[3])), 8)
check(ffi.b(_.is0(_[0])), true)
check(ffi.b(_.is0(_[1])), false)
check(ffi.b(_.leq(_[1])(_[2])), true)
check(ffi.b(_.leq(_[2])(_[2])), true)
check(ffi.b(_.leq(_[2])(_[1])), false)
check(ffi.b(_.lt(_[1])(_[2])), true)
check(ffi.b(_.lt(_[2])(_[2])), false)
check(ffi.b(_.null(shell)), false)
check(ffi.b(_.null(_.nil)), true)
check(ffi.i _.idiv(_[4])(_[3]), 1)
check(ffi.i _.mod(_[4])(_[3]), 1)

determ()
