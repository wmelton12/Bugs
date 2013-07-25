class Plane
  constructor: (@draw) ->
    @obs = []
    @bugs = []
  addObstacle: (points) ->
    @obs[@obs.length] = new Obstacle(points, @draw)
    return @obs[@obs.length - 1]
  drawPoint: (x,y) ->
  	@draw.circle(3).move(x,y).attr("fill","green")
  checkCollision: (x,y)-> 
    i = 0
    while( i < @obs.length )
      if( @obs[i].intersectsPoint(x,y) ) then return true
      i++
    return false
this.Plane=Plane
