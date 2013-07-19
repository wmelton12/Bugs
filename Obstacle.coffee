# Notes
#   @points must be a list of points, not in string form!!!!!!!!!!!!
class Obstacle
  constructor: (@x,@y,@points,@draw) ->
    @draw.polygon(@points).fill('black').stroke({ width: 1 }) 
