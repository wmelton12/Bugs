class Plane
  constructor: (@draw) ->
    @obs = []
  addObstacle: (points) ->
    @bugs = []
    @obs[@obs.length] = new Obstacle(points, @draw)
    return @obs[@obs.length - 1]
  checkCollision: (points)-> 
    i = 0
    while( i < @obs.length )
      if( @obs[i].intersectsPoint ) return true
    return false
   addBug: (x,y) ->
