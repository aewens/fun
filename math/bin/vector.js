// Generated by CoffeeScript 1.7.1
(function() {
  var Vector,
    __slice = [].slice;

  Vector = (function() {
    function Vector(x, y) {
      this.head = new Point(x, y);
    }

    Vector.prototype.set = function() {
      var args;
      args = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
      if (args.length === 1) {
        if (args[0] instanceof Point) {
          this.tail = args[0];
        } else if (args[0] instanceof Vector) {
          this.tail = args[0].head;
        }
      } else if (args.lenths === 2) {
        this.tail = new Point(args[0], args[1]);
      } else {
        this.tail = new Point(0, 0);
      }
      return this;
    };

    Vector.prototype.add = function(v) {
      var x, y;
      x = this.head.x + v.head.x;
      y = this.head.y + v.head.y;
      return new Vector(x, y).set(this.tail);
    };

    Vector.prototype.mult = function(n) {
      if (typeof n === "number") {
        this.head.set(this.head.x * n, this.head.y * n);
      }
      return this;
    };

    Vector.prototype.magnitude = function() {
      return sqrt(sqre(this.head.x) + sqre(this.head.y));
    };

    Vector.prototype.mag = function() {
      return this.magnitude();
    };

    Vector.prototype.render = function(world) {
      var end, hx, hy, tx, ty, _ref;
      end = [this.head.x + this.tail.x, this.head.y + this.tail.y];
      _ref = this.tail.get().concat(end).map(function(n) {
        return n * world.unit;
      }), tx = _ref[0], ty = _ref[1], hx = _ref[2], hy = _ref[3];
      return world.line(tx, ty, hx, hy);
    };

    return Vector;

  })();

  window.Vector = Vector;

}).call(this);
