// Generated by CoffeeScript 1.7.1
(function() {
  var World, grid, paint, paper, ph, pw, render, v1, v2, v3, world;

  World = (function() {
    function World() {
      var mod;
      this.paper = document.querySelector("#paper");
      this.paint = this.paper.getContext("2d");
      mod = pow(2, 2);
      this.ratio = [mod * 4, mod * 3];
      this.unit = this.resize(this.ratio[0], this.ratio[1]);
    }

    World.prototype.resize = function(r0, r1) {
      var binr, h, hone, k, m0, m1, p, q, r, r2, s, unit, unit0, unit1, w, x, y;
      w = parseInt(window.innerWidth);
      h = parseInt(window.innerHeight);
      r2 = r1 / r0;
      binr = function(n) {
        return pow(2, floor(log(n) / log(2)));
      };
      hone = function(a, b, c, r) {
        if (a > c) {
          if (b > c * r) {
            return [c, c * r];
          } else {
            return hone(a, b, c * r, r);
          }
        } else {
          return hone(a, b, c * r, r);
        }
      };
      k = [(r0 > r1 ? w : h), (r0 > r1 ? h : w)];
      q = binr(k[0]);
      p = hone(k[0], k[1], q, r2);
      x = p[(r0 > r1 ? 0 : 1)];
      y = p[(r0 > r1 ? 1 : 0)];
      r = min(r0, r1);
      s = max(x, y);
      unit0 = binr(floor(s / r));
      unit1 = binr(floor(s / (r + 1)));
      unit = (unit0 + unit1) / 2;
      this.paper.width = unit * r0;
      this.paper.height = unit * r1;
      m0 = (h - this.paper.height) / 2;
      m1 = (w - this.paper.width) / 2;
      this.paper.style.margin = "" + m0 + "px " + m1 + "px";
      return unit;
    };

    World.prototype.line = function(x0, y0, x1, y1) {
      this.paint.beginPath();
      this.paint.moveTo(x0, y0);
      this.paint.lineTo(x1, y1);
      this.paint.closePath();
      return this.paint.stroke();
    };

    return World;

  })();

  world = new World;

  paper = world.paper;

  paint = world.paint;

  pw = paper.width;

  ph = paper.height;

  grid = new Grid(world, pw, ph);

  grid.blocks(world.unit);

  v1 = new Vector(3, 5).set(2, 2).mult(2);

  v2 = new Vector(5, -3).set(v1);

  v3 = v1.add(v2);

  render = function() {
    paint.clearRect(0, 0, pw, ph);
    grid.render();
    v1.render(world);
    v2.render(world);
    return v3.render(world);
  };

  render();

}).call(this);
