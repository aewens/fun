// Generated by CoffeeScript 1.7.1
(function() {
  var Canvas, _ref;

  this.App = (_ref = window.App) != null ? _ref : {};

  Canvas = (function() {
    function Canvas(width, height) {
      this.canvas = document.createElement("canvas");
      this.canvas.width = width;
      this.canvas.height = height;
      this.ctx = (function(ctx) {
        ctx.width = ctx.canvas.width;
        ctx.height = ctx.canvas.height;
        ctx.drawPoly = function(p, x, y) {
          var i, _i, _ref1;
          p = p.points;
          this.beginPath();
          this.moveTo(p[0] + x, p[1] + y);
          for (i = _i = 0, _ref1 = p.slice(2).length; _i < _ref1; i = _i += 2) {
            this.lineTo(p[i] + x, p[i + 1] + y);
          }
          this.closePath();
          return this.stroke();
        };
        ctx.clear = function() {
          return this.clearRect(0, 0, this.width, this.height);
        };
        return ctx;
      })(this.canvas.getContext("2d"));
      document.body.appendChild(this.canvas);
    }

    Canvas.prototype.animate = function(leup) {
      var l, rf, self;
      rf = (function() {
        return window.requestAnimationFrame;
      })();
      self = this;
      l = function() {
        leup();
        return rf(l, self.canvas);
      };
      return rf(l, this.canvas);
    };

    return Canvas;

  })();

  this.App.Canvas = Canvas;

}).call(this);
