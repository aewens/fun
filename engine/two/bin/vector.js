// Generated by CoffeeScript 1.7.1
(function() {
  var Vector, _ref;

  this.App = (_ref = window.App) != null ? _ref : {};

  Vector = (function() {
    function Vector(x, y) {
      this.x = x;
      this.y = y;
    }

    Vector.prototype.grow = function(s) {
      return new Vector(this.x + s, this.y + s);
    };

    Vector.prototype.shrink = function(s) {
      return new Vector(this.x - s, this.y - s);
    };

    Vector.prototype.scale = function(s) {
      return new Vector(this.x * s, this.y * s);
    };

    Vector.prototype.compress = function(s) {
      return new Vector(this.x / s, this.y / s);
    };

    Vector.prototype.add = function(v) {
      return new Vector(this.x + v.x, this.y + v.y);
    };

    Vector.prototype.sub = function(v) {
      return new Vector(this.x - v.x, this.y - v.y);
    };

    Vector.prototype.norm = function() {
      return new Vector(this.x / this.mag(), this.y / this.mag());
    };

    Vector.prototype.mag = function() {
      return Math.sqrt(this.x * this.x + this.y * this.y);
    };

    Vector.prototype.dot = function(v) {
      return this.x * v.x + this.y * v.y;
    };

    Vector.prototype.dot2 = function(u, v) {
      return u.x * v.x + u.y * v.y;
    };

    Vector.prototype.theta = function(v) {
      return Math.acos(this.dot2(this.norm(), v.norm()));
    };

    return Vector;

  })();

}).call(this);