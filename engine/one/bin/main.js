// Generated by CoffeeScript 1.7.1
(function() {
  require.config({
    urlArgs: "nocache=" + (new Date).getTime()
  });

  require(["pappai"], function(Pappai) {
    var origin, pn, wh, wx, _, _i, _len, _ref;
    Pappai.Init(500, 200, true);
    wx = window.innerWidth;
    wh = window.innerHeight;
    pn = [];
    _ref = new Array(4);
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      _ = _ref[_i];
      pn.push(Pappai.Node());
    }
    pn[0].set(0, wh / 2);
    pn[1].set(wx, wh / 2);
    pn[2].set(wx / 2, 0);
    pn[3].set(wx / 2, wh);
    pn[0].link(pn[1]);
    pn[2].link(pn[3]);
    origin = Pappai.Circle(4);
    return origin.set(wx / 2, wh / 2).render();
  });

}).call(this);
