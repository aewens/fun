// Generated by CoffeeScript 1.7.1
(function() {
  var M,
    __slice = [].slice;

  M = function() {
    var xs;
    xs = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
    if (M.nothing(xs)) {
      return M.None();
    } else {
      if (xs instanceof M) {
        return xs;
      } else {
        return M.Some(xs);
      }
    }
  };

  M.nothing = function(x) {
    switch ("" + x) {
      case null:
        return true;
      case void 0:
        return true;
      case "false":
        return true;
      case "":
        return true;
      default:
        return false;
    }
  };

  M.error = "I'm sorry Dave, I'm afraid I can't do that";

  M.Some = function(x) {
    return new M.fn.init(true, x);
  };

  M.None = function() {
    return new M.fn.init(false, null);
  };

  M.fn = M.prototype = {
    init: function(usable, x) {
      if (x === null && usable) {
        throw this.error;
      }
      if (usable) {
        if (x.length > 1) {
          this.list = true;
          this.x = x.map(function(y) {
            return new M(y);
          });
          this.value = this.x;
          this.usable = this.all();
        } else if (x[0] !== void 0 && x[0].length >= 1) {
          this.list = true;
          this.x = x[0].map(function(y) {
            return new M(y);
          });
          this.value = this.x;
          this.usable = this.all();
        } else {
          this.usable = usable;
          this.list = false;
          this.x = x[0];
          this.value = this.x;
        }
      } else {
        this.usable = usable;
        this.list = false;
        this.x = x;
        this.value = this.x;
      }
      return this;
    },
    maybe: function(x) {
      return new M(x);
    },
    of: function(x) {
      return new M(x);
    },
    orSome: function(x) {
      if (this.list) {
        if (this.all()) {
          return this.x;
        } else {
          return x;
        }
      } else if (this.usable) {
        return this.x;
      } else {
        return x;
      }
    },
    orElse: function(x) {
      if (this.list) {
        if (this.any()) {
          return this;
        } else {
          return new M(x);
        }
      } else if (this.usable) {
        return this;
      } else {
        return new M(x);
      }
    },
    elsewise: function(x) {
      var xs;
      xs = this.list ? this.x : new M([this.x]).x;
      if (this.any()) {
        return new M(xs).bind(function(x) {
          return x;
        });
      } else {
        return x;
      }
    },
    otherwise: function(x) {
      return this.orSome(x);
    },
    elser: function(x) {
      return this.orElse(x);
    },
    diverge: function(x) {
      return this.elsewise(x);
    },
    choose: function(x, y) {
      if (this.x) {
        return x;
      } else {
        return y;
      }
    },
    swap: function(x, y) {
      return this.x = this.x ? x : y;
    },
    bind: function(fn) {
      if (this.list) {
        return this.x.map(function(x) {
          return x.bind(fn);
        });
      } else if (this.usable) {
        return fn(this.x);
      } else {
        return this;
      }
    },
    lift: function(fn) {
      if (this.list) {
        return this.bind(fn).map(function(x) {
          return new M(x);
        });
      } else {
        return new M(this.bind(fn));
      }
    },
    bond: function(fn) {
      var self;
      self = this;
      return function(y) {
        if (self.list) {
          return self.x.map(function(x) {
            return self.bond(f)(y);
          });
        } else if (self.usable) {
          return fn(self.x, y);
        } else {
          return self;
        }
      };
    },
    hoist: function(fn) {
      var self;
      self = this;
      return function(y) {
        if (this.list) {
          return this.bond(fn)(y).map(function(x) {
            return new M(x);
          });
        } else {
          return new M(this.bond(fn)(y));
        }
      };
    },
    merge: function(fn) {
      var self;
      self = this;
      return function(y) {
        if (this.list) {
          return this.bond(fn)(y.x).map(function(x) {
            return new M(x);
          });
        } else {
          return new M(this.bond(fn)(y.x));
        }
      };
    },
    some: function() {
      if (this.usable) {
        if (this.list) {
          return this.x.filter(function(x) {
            return x.isSome;
          }).map(function(x) {
            return x.x;
          });
        } else {
          return this.x;
        }
      } else {
        throw M.error;
      }
    },
    isSome: function() {
      return this.usable;
    },
    isNone: function() {
      return !this.isSome();
    },
    toString: function() {
      if (this.usable) {
        return "Some(" + this.x + ")";
      } else {
        return "None";
      }
    },
    to_s: function() {
      return this.toString();
    },
    show: function() {
      return this.some();
    },
    all: function() {
      var l0, l1, xs;
      xs = this.list ? this.x : new M([this.x]).x;
      l0 = xs.length;
      l1 = xs.filter(function(x) {
        return x.isSome();
      }).length;
      return l0 === l1;
    },
    any: function() {
      var xs;
      xs = this.list ? this.x : new M([this.x]).x;
      return xs.filter(function(x) {
        return x.isSome();
      }).length > 0;
    },
    unwrap: function() {
      if (this.list) {
        return this.x.map(function(x) {
          return x.x;
        });
      } else {
        return this.x;
      }
    },
    open: function() {
      return this.unwrap();
    },
    pick: function(f, g) {
      if (this.all()) {
        return new M(this.x).bind(f);
      } else {
        return new M(this.x).bind(g);
      }
    },
    select: function(f, g) {
      if (this.any()) {
        return new M(this.x).bind(f);
      } else {
        return new M(this.x).bind(g);
      }
    },
    choose: function(x, y) {
      if (this.all()) {
        return x;
      } else {
        return y;
      }
    },
    decide: function(x, y) {
      if (this.any()) {
        return x;
      } else {
        return y;
      }
    }
  };

  M.fn.init.prototype = M.fn;

  window.M = M;

}).call(this);
