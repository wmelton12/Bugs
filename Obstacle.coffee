class Obstacle
  constructor: (@x,@y,@points,@draw) ->
    @draw.polygon(@points).fill('black').stroke({ width: 1 })

