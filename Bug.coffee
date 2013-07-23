class Bug
  constructor: (@x,@y) ->
    @plane = null
    @heading = 0 # degrees
  move: ()->
  getRefPoints: ()->
    points = []
    points[points.length] = [@x + 0.001 * Math.cos(@degreesToRadians(@heading)), @y + 0.001 * Math.sin(@degreesToRadians(@heading))]
    rightAnge = @degreesToRadians(@heading - 90)
    points[points.length] = [@x + 0.001 * Math.cos(rightAngle), @y + 0.001 * Math.sin(rightAngle)]
    backAngle = @heading + 180
    points[points.length] = [@x + 0.001 * Math.cos(backAngle), @y + 0.001 * Math.sin(backAngle)]
    leftAngle = @heading + 90
    points[points.length] = [@x + 0.001 * Math.cos(leftAngle), @y + 0.01 * Math.sin(leftAngle)]
    return points
  putInPlane: (plane) ->
    @plane = plane
  degreesToRadians: (degs) ->
    return degs * (Math.pi / 180)
  radiansToDegrees: (rads) ->
    return rads * (180 / Math.pi)
this.Bug = Bug
