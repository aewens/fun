// Generated by CoffeeScript 1.7.1
(function() {
  define(["curry"], function($c) {
    var P;
    P = function(x, y, z) {
      return new P.fn.init(x, y, z);
    };
    P.fn = P.prototype = {
      init: function(x, y, z) {
        this.x = x || 0;
        this.y = y || 0;
        this.z = z || 0;
        this.type = "p";
        return this;
      },
      add: function(vec) {
        if (vec.type !== "v") {
          return this;
        }
        this.x = this.x + vec.x;
        this.y = this.y + vec.y;
        this.z = this.z + vec.z;
        return this;
      }
    };
    P.fn.init.prototype = P.fn;
    return P;
  });

}).call(this);