// Generated by CoffeeScript 1.7.1
(function() {
  var $, Pappai, ch, cw, factors, gcd, i, j, k, pa, pn, point, quux, vec2, wh, ww, _i, _j, _k, _l, _len, _ref, _ref1;

  this.App = (_ref = window.App) != null ? _ref : {};

  $ = this.App.$;

  Pappai = this.App.Pappai;

  Pappai.Init(500, 200, true);

  ww = window.innerWidth;

  wh = window.innerHeight;

  cw = ww / 2;

  ch = wh / 2;

  factors = function(x) {
    var f, i, q, _i;
    f = [];
    q = 0;
    for (i = _i = 1; 1 <= x ? _i < x : _i > x; i = 1 <= x ? ++_i : --_i) {
      q = x / i;
      if (q === Math.floor(q)) {
        f.push(i);
      }
    }
    return f;
  };

  gcd = function(x, y) {
    if (!y) {
      return x;
    }
    return gcd(y, x % y);
  };

  pn = [];

  pa = gcd(ww, wh);

  console.log(pa);

  _ref1 = new Array(pa * 4);
  for (_i = 0, _len = _ref1.length; _i < _len; _i++) {
    quux = _ref1[_i];
    pn.push(Pappai.Node());
  }

  for (i = _j = 0; 0 <= pa ? _j < pa : _j > pa; i = 0 <= pa ? ++_j : --_j) {
    pn[i].set(0, i * (ww / pa));
    pn[i + pa].set(ww, i * (ww / pa));
  }

  for (j = _k = 0; _k < pa; j = _k += 2) {
    pn[j + pa * 2].set(j * (wh / pa), 0);
    pn[j + pa * 3].set(j * (wh / pa), wh);
  }

  for (k = _l = 0; 0 <= pa ? _l < pa : _l > pa; k = 0 <= pa ? ++_l : --_l) {
    pn[k].link(pn[k + pa]);
    pn[k + pa * 2].link(pn[k + pa * 3]);
  }

  point = function(x, y) {
    return new point.init(x, y);
  };

  point.init = function(x, y) {
    this.x = x;
    this.y = y;
    return this;
  };

  point.prototype = {
    to: function(p) {
      return vec2(p.x - this.x, p.y - this.y).at(this);
    }
  };

  point.init.prototype = point.prototype;

  vec2 = function(x, y) {
    return new vec2.init(x, y);
  };

  vec2.init = function(x, y) {
    this.x = x;
    this.y = y;
    this.ox = 0;
    this.oy = 0;
    return this;
  };

  vec2.prototype = {
    at: function(p) {
      this.ox = p.x;
      this.oy = p.y;
      return this;
    },
    mag: function() {
      return Math.sqrt((this.x * this.x) + (this.y * this.y));
    },
    head: function() {
      return [this.x, this.y];
    },
    tail: function() {
      return [this.ox, this.oy];
    }
  };

  vec2.init.prototype = vec2.prototype;

  console.log(vec2(2, 3).tail());

  console.log(point(0, 0).to(point(2, 3)));

}).call(this);
