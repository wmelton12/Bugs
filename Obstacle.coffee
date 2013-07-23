# Notes
#   @points must be a list of points, not in string form!!!!!!!!!!!!
class Obstacle
  constructor: (@points,@draw) ->
    @poly = @draw.polygon(@points).fill('black').stroke({ width: 1 }).attr('id',"#{ @points[0][0] } + #{ @points[0][1] }")
    @edges = []
    i = 1
    while i < @points.length
      g = new Line(@points[i - 1][0], @points[i-1][1], @points[i][0], @points[i][1], @draw)
      @edges.push(g)
    g = new Line(@points[0][0], @points[0][1], @points[@points.length - 1][0], @points[@points.length - 1][1], @draw)
    @edges.push(g)
    @bb = document.getElementById(@poly.attr('id')).getBBox()
  intersectsPoint: (x,y) ->
    pointsBeforePoint = []
    if !(@bb.y < y < @bb.y + @bb.height) then return false
    i = 0
    l = new Line(0,y,@draw.size()[0],y,@draw,false)
    while(i < @edges.length)
      if(l.passesThroughLine(@edges[i]))
        p = l.intersection(@edges[i])
        if(p[0] <= x)
          pointsBeforePoint.push(p)

      i++
    return !(pointsBeforePoint.length % 2) 
this.Obstacle = Obstacle
