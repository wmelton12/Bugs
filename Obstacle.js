// Generated by CoffeeScript 1.6.3
(function() {
  var Obstacle;

  Obstacle = (function() {
    function Obstacle(points, draw) {
      var i;
      this.points = points;
      this.draw = draw;
      this.poly = this.draw.polygon(this.points).fill('black').stroke({
        width: 1
      }).attr('id', "" + this.points[0][0] + " + " + this.points[0][1]).attr("transform", "translate(0,0)");
      this.edges = [];
      i = 1;
      while (i < this.points.length) {
        this.edges[this.edges.length] = new Line(this.points[i - 1][0], this.points[i - 1][1], this.points[i][0], this.points[i][1], this.draw);
        i++;
      }
      this.edges[this.edges.length] = new Line(this.points[this.points.length - 1][0], this.points[this.points.length - 1][1], this.points[0][0], this.points[0][1], this.draw);
      this.bb = document.getElementById(this.poly.attr('id')).getBBox();
    }

    Obstacle.prototype.intersectsPoint = function(x, y) {
      var count, j, l, p;
      if (!((this.bb.y < y && y < this.bb.y + this.bb.height) && (this.bb.x < x && x < this.bb.x + this.bb.width))) {
        return false;
      }
      j = 0;
      count = 0;
      l = new Line(0, y, 1000, y, this.draw, false);
      while (j < this.edges.length) {
        if (l.passesThroughLine(this.edges[j])) {
          p = l.intersection(this.edges[j]);
          if (p[0] <= x) {
            count++;
          }
        }
        j++;
      }
      return count % 2 === 1;
    };

    return Obstacle;

  })();

  this.Obstacle = Obstacle;

}).call(this);
