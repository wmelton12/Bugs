class Plane
  constructor: (@draw) ->
    @obs = []
  addObstacle: (points) ->
    @bugs = []
    @obs[@obs.length] = new Obstacle(points, @draw)
    return @obs[@obs.length - 1]
  drawPoint: (x,y) ->
  	@draw.circle(1).move(x,y)
  checkCollision: (x,y)-> 
    i = 0
    while( i < @obs.length )
      if( @obs[i].intersectsPoint(x,y) ) then return true
    return false
this.Plane=Plane