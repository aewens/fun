// Generated by CoffeeScript 1.7.1
(function() {
  var Bullet, _ref;

  this.App = (_ref = window.App) != null ? _ref : {};

  Bullet = (function() {
    function Bullet(x, y, angle) {
      this.x = x;
      this.y = y;
      this.omit = false;
      this.vel = {
        x: 5 * Math.cos(angle),
        y: 5 * Math.sin(angle)
      };
      this.max = {
        x: null,
        y: null
      };
    }

    Bullet.prototype.update = function() {
      this.prevX = this.x;
      this.prevY = this.y;
      if (this.x < 0 || this.x >= this.max.x || this.y < 0 || this.y >= this.max.y) {
        this.omit = true;
      }
      this.x = this.prevX + this.vel.x;
      return this.y = this.prevY + this.vel.y;
    };

    Bullet.prototype.render = function(ctx) {
      ctx.beginPath();
      ctx.moveTo(this.prevX, this.prevY);
      ctx.lineTo(this.x, this.y);
      ctx.stroke();
      return ctx.closePath();
    };

    return Bullet;

  })();

  this.App.Bullet = Bullet;

}).call(this);