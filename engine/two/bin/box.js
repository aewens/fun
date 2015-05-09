// Generated by CoffeeScript 1.7.1
(function() {
  define(["pappai"], function(Pappai) {
    var Box;
    Box = (function() {
      function Box(x, y, w, h) {
        this.x = x;
        this.y = y;
        this.w = w;
        this.h = h;
      }

      Box.prototype.intersects = function(s) {
        var c0, c1, c2, c3, ca, cb, cc, cd, offset, _ref;
        offset = (_ref = s.radius) != null ? _ref : 0;
        c0 = this.contains(s.x - offset, s.y - offset);
        c1 = this.contains(s.x + s.width - offset, s.y - offset);
        c2 = this.contains(s.x - offset, s.y + s.height - offset);
        c3 = this.contains(s.x + s.width - offset, s.y + s.height - offset);
        ca = this.contains(this.x - offset, this.y - offset);
        cb = this.contains(this.x + this.w - offset, this.y - offset);
        cc = this.contains(this.x - offset, this.y + this.h - offset);
        cd = this.contains(this.x + this.w - offset, this.y + this.h - offset);
        if (c0 || c1 || c2 || c3) {
          return true;
        } else if (ca || cb || cc || cd) {
          return true;
        }
        return false;
      };

      Box.prototype.contains = function(x, y) {
        return !!(x >= this.x && x <= this.x + this.w && y >= this.y && y <= this.y + this.h);
      };

      Box.prototype.has = function(x, y) {
        return this.contains(x, y);
      };

      Box.prototype.render = function(color) {
        color = color || false;
        return Pappai.Box(this.w, this.h).set(this.x, this.y).fg(color).render();
      };

      return Box;

    })();
    return Box;
  });

}).call(this);
