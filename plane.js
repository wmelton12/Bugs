// Generated by CoffeeScript 1.6.3
(function() {
  var Plane;

  Plane = (function() {
    function Plane(draw) {
      this.draw = draw;
      this.obs = [];
    }

    Plane.prototype.addObstacle = function(points) {
      this.bugs = [];
      this.obs[this.obs.length] = new Obstacle(points, this.draw);
      return this.obs[this.obs.length - 1];
    };

    Plane.prototype.drawPoint = function(x, y) {
      return this.draw.circle(1).move(x, y);
    };

    Plane.prototype.checkCollision = function(x, y) {
      var i;
      i = 0;
      while (i < this.obs.length) {
        if (this.obs[i].intersectsPoint(x, y)) {
          return true;
        }
      }
      return false;
    };

    return Plane;

  })();

  this.Plane = Plane;

}).call(this);