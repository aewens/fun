// Generated by CoffeeScript 1.7.1
(function() {
  var Asteroid, AsteroidSize, GameState, Points, Ship, ShipSize, State, _ref,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  this.App = (_ref = window.App) != null ? _ref : {};

  State = this.App.State;

  Asteroid = this.App.Asteroid;

  Ship = this.App.Ship;

  Points = {
    ASTEROIDS: [[-4, -2, -2, -4, 0, -2, 2, -4, 4, -2, 3, 0, 4, 2, 1, 4, -2, 4, -4, 2, -4, -2], [-3, 0, -4, -2, -2, -4, 0, -3, 2, -4, 4, -2, 2, -1, 4, 1, 2, 4, -1, 3, -2, 4, -4, 2, -3, 0], [-2, 0, -4, -1, -1, -4, 2, -4, 4, -1, 4, 1, 2, 4, 0, 4, 0, 1, -2, 4, -4, 1, -2, 0], [-1, -2, -2, -4, 1, -4, 4, -2, 4, -1, 1, 0, 4, 2, 2, 4, 1, 3, -2, 4, -4, 1, -4, -2, -1, -2], [-4, -2, -2, -4, 2, -4, 4, -2, 4, 2, 2, 4, -2, 4, -4, 2, -4, -2]],
    SHIP: [-2, 0, -3, -3, 6, 0, -3, 3, -2, 0]
  };

  AsteroidSize = 8;

  ShipSize = 2;

  GameState = (function(_super) {
    __extends(GameState, _super);

    function GameState(game) {
      GameState.__super__.constructor.call(this, game);
      this.w = this.game.canvas.ctx.width;
      this.h = this.game.canvas.ctx.height;
      this.ship = new Ship(Points.SHIP, ShipSize, this.w / 2, this.h / 2);
      this.ship.max.x = this.w;
      this.ship.max.y = this.h;
      this.generateLevel();
    }

    GameState.prototype.generateLevel = function() {
      var a, astr, i, num, x, y, _i, _results;
      num = 3;
      this.asteroids = [];
      _results = [];
      for (i = _i = 0; 0 <= num ? _i < num : _i > num; i = 0 <= num ? ++_i : --_i) {
        a = Math.round(Math.random() * (Points.ASTEROIDS.length - 1));
        x = Math.round(Math.random() * (this.w - 1));
        y = Math.round(Math.random() * (this.h - 1));
        astr = new Asteroid(Points.ASTEROIDS[a], AsteroidSize, x, y);
        astr.max.x = this.w;
        astr.max.y = this.h;
        _results.push(this.asteroids.push(astr));
      }
      return _results;
    };

    GameState.prototype.update = function() {
      var astr, _i, _len, _ref1;
      _ref1 = this.asteroids;
      for (_i = 0, _len = _ref1.length; _i < _len; _i++) {
        astr = _ref1[_i];
        astr.update();
      }
      return this.ship.update();
    };

    GameState.prototype.render = function(ctx) {
      var astr, _i, _len, _ref1;
      ctx.clear();
      _ref1 = this.asteroids;
      for (_i = 0, _len = _ref1.length; _i < _len; _i++) {
        astr = _ref1[_i];
        astr.render(ctx);
      }
      return this.ship.render(ctx);
    };

    return GameState;

  })(State);

  this.App.GameState = GameState;

}).call(this);
