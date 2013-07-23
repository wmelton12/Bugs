// Generated by CoffeeScript 1.6.3
(function() {
  var Bug1,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  Bug1 = (function(_super) {
    __extends(Bug1, _super);

    function Bug1(x, y, gx, gy) {
      this.x = x;
      this.y = y;
      this.gx = gx;
      this.gy = gy;
      Bug1.__super__.constructor.call(this, this.x, this.y);
      this.wallFollowing = false;
      this.firstLap = true;
      this.shortestPoint = [];
      this.encounteredObj = [];
    }

    return Bug1;

  })(Bug);

  ({
    move: function() {
      var refPoints, toMove, _ref, _ref1, _ref2, _ref3;
      refPoints = this.getRefPoints();
      if (!this.wallFollowing) {
        if ((_ref = this.plane).checkCollision.apply(_ref, refPoints[0])) {
          this.encounteredObj = [this.x, this.y];
          this.wallFollowing = true;
          while (!(_ref1 = this.plane).checkCollison.apply(_ref1, refPoints[1])) {
            this.heading -= 1;
          }
          toMove = [this.x + 0.001 * Math.cos(this.degreesToRadians(this.heading)), this.y + 0.001 * Math.sin(this.degreesToRadians(this.heading))];
          this.x = toMove[0];
          this.y = toMove[1];
        } else {
          this.x = refPoints[0][0];
          this.y = refPoint[0][1];
        }
      } else {
        if (this.firstLap) {
          if (this.shortestPoint.length === 0) {
            this.shortestPoint = [this.x, this.y];
          } else if (this.dist(this.x, this.y, this.gx, this.gy) < this.dist(this.shortestPoint[0], this.shortestPoint[1], this.gx, this.gy)) {
            this.shortestPoint = [this.x, this.y];
          }
          while (!(_ref2 = this.plane).checkCollison.apply(_ref2, refPoints[1])) {
            this.heading -= 1;
          }
          while (this.plane.checkCollision(refPoints[0])) {
            this.heading += 1;
          }
          toMove = [this.x + 0.001 * Math.cos(this.degreesToRadians(this.heading)), this.y + 0.001 * Math.sin(this.degreesToRadians(this.heading))];
          this.x = toMove[0];
          this.y = toMove[1];
          if (this.atPoint.apply(this, this.encounteredObs)) {
            this.firstLap = false;
          }
        } else {
          if (!this.atPoint(this.shortestPoint)) {
            while (!(_ref3 = this.plane).checkCollison.apply(_ref3, refPoints[1])) {
              this.heading -= 1;
            }
            while (this.plane.checkCollision(refPoints[0])) {
              this.heading += 1;
            }
            toMove = [this.x + 0.001 * Math.cos(this.degreesToRadians(this.heading)), this.y + 0.001 * Math.sin(this.degreesToRadians(this.heading))];
            this.x = toMove[0];
            this.y = toMove[1];
          } else {
            this.encounteredObj = [];
            this.shortestPoint = [];
            this.orientTowardsGoal();
            toMove = [this.x + 0.001 * Math.cos(this.degreesToRadians(this.heading)), this.y + 0.001 * Math.sin(this.degreesToRadians(this.heading))];
            this.x = toMove[0];
            this.y = toMove[1];
            this.wallFollowing = false;
          }
        }
      }
      if (this.plane !== null) {
        return this.plane.drawPoint(this.x, this.y);
      }
    },
    orientTowardsGoal: function() {
      return this.heading = Math.atan((this.gy - this.y) / (this.gx - this.x));
    },
    atPoint: function(px, py) {
      return this.dist(this.x, this.y, px, py) < 0.001;
    },
    dist: function(x1, y1, x2, y2) {
      return Math.sqrt(Math.pow(x2 - x1, 2) + Math.pow(y2 - y1, 2));
    },
    printPlane: function() {
      return console.log(this.plane);
    }
  });

  this.Bug1 = Bug1;

}).call(this);