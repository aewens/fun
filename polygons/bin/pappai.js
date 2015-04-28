// Generated by CoffeeScript 1.7.1
(function() {
  var $, CBox, CCircle, CNode, CSquare, Pappai, _ref,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  this.App = (_ref = window.App) != null ? _ref : {};

  $ = this.App.$;

  CNode = (function() {
    function CNode() {
      this.PAPER = $.get("#pappai");
      this.PAINT = this.PAPER.getContext("2d");
      this.x = 0;
      this.y = 0;
      this.xx = 0;
      this.yy = 0;
      this.fcolor = "#000";
      this.bcolor = "#fff";
      this.scolor = "#000";
    }

    CNode.prototype.give = function(k, v) {
      this[k] = v;
      return this;
    };

    CNode.prototype.get = function(k) {
      return this[k];
    };

    CNode.prototype.mid = function(x, y) {
      return [x, y];
    };

    CNode.prototype.set = function(x, y) {
      var xy;
      this.x = x;
      this.y = y;
      xy = this.mid(x, y);
      this.xx = xy[0];
      this.yy = xy[1];
      return this;
    };

    CNode.prototype.fg = function(color) {
      this.fcolor = color || this.fcolor;
      return this;
    };

    CNode.prototype.bg = function(color) {
      this.bcolor = color || this.bcolor;
      return this;
    };

    CNode.prototype.sg = function(color) {
      this.scolor = color || this.scolor;
      return this;
    };

    CNode.prototype.line = function(xa, ya, xb, yb) {
      this.PAINT.beginPath();
      this.PAINT.moveTo(xa, ya);
      this.PAINT.lineTo(xb, yb);
      this.PAINT.closePath();
      this.PAINT.strokeStyle = this.scolor;
      return this.PAINT.stroke();
    };

    CNode.prototype.link = function(node) {
      if (node instanceof CNode) {
        this.line(this.xx, this.yy, node.xx, node.yy);
      }
      return this;
    };

    return CNode;

  })();

  CCircle = (function(_super) {
    __extends(CCircle, _super);

    function CCircle(Pappai, radius) {
      this.give("radius", radius);
      this.give("pi", Math.PI);
      this.give("tau", 2 * Math.PI);
      CCircle.__super__.constructor.apply(this, arguments);
    }

    CCircle.prototype.mid = function(x, y) {
      return [x, y];
    };

    CCircle.prototype.render = function() {
      this.PAINT.closePath();
      this.PAPER.style.backgroundColor = this.bcolor;
      this.PAINT.fillStyle = this.fcolor;
      this.PAINT.arc(this.x, this.y, this.radius, 0, this.tau);
      this.PAINT.fill();
      return this;
    };

    return CCircle;

  })(CNode);

  CBox = (function(_super) {
    __extends(CBox, _super);

    function CBox(Pappai, width, height) {
      this.give("width", width);
      this.give("height", height);
      CBox.__super__.constructor.apply(this, arguments);
    }

    CBox.prototype.mid = function(x, y) {
      return [x + (this.width / 2), y + (this.height / 2)];
    };

    CBox.prototype.render = function() {
      this.PAINT.closePath();
      this.PAPER.style.backgroundColor = this.bcolor;
      this.PAINT.fillStyle = this.fcolor;
      this.PAINT.rect(this.x, this.y, this.width, this.height);
      this.PAINT.fill();
      return this;
    };

    return CBox;

  })(CNode);

  CSquare = (function(_super) {
    __extends(CSquare, _super);

    function CSquare(Pappai, side) {
      this.give("side", side);
      CSquare.__super__.constructor.apply(this, arguments);
    }

    CSquare.prototype.mid = function(x, y) {
      return [x + (this.side / 2), y + (this.side / 2)];
    };

    CSquare.prototype.render = function() {
      this.PAINT.closePath();
      this.PAPER.style.backgroundColor = this.bcolor;
      this.PAINT.fillStyle = this.fcolor;
      this.PAINT.fillRect(this.x, this.y, this.side, this.side);
      this.PAINT.fill();
      return this;
    };

    return CSquare;

  })(CNode);

  Pappai = {
    Init: function(width, height, theater) {
      var canvas;
      console.log(document.body);
      canvas = $.create("canvas", "pappai").into(document.body);
      if (theater) {
        $.find("html").css({
          "margin": 0,
          "padding": 0
        });
        $.find("body").css({
          "margin": 0,
          "padding": 0
        });
        return canvas.attr.set("width", window.innerWidth).attr.set("height", window.innerHeight);
      } else {
        return canvas.attr.set("width", width).attr.set("height", height);
      }
    },
    Node: function() {
      return new CNode();
    },
    Circle: function(radius) {
      return new CCircle(this, radius);
    },
    Box: function(width, height) {
      return new CBox(this, width, height);
    },
    Square: function(side) {
      return new CSquare(this, side);
    }
  };

  this.App.Pappai = Pappai;

}).call(this);