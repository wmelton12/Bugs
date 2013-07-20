class Plane
  constructor: (@draw) ->
    @obs = []
  addObstacle: (points) ->
    @bugs = []
    @obs[@obs.length] = new Obstacle(points, @draw)
    return @obs[@obs.length - 1]
  checkCollision: (x,y)-> 
    i = 0
    while( i < @obs.length )
      if( @obs[i].intersectsPoint(x,y) ) return true
    return false
