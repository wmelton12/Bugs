class Bug
  constructor: (@x,@y) ->
    @plane = null
  move: ()->
  
  getRefPoints: ()->
    console.log("Bug heading: " + @heading)
    points = []
    points[points.length] = [@x + 0.05 * Math.cos(@degreesToRadians(@heading)), @y + 0.05 * Math.sin(@degreesToRadians(@heading))]
    rightAngle = @degreesToRadians(@heading - 90)
    points[points.length] = [@x + 0.05 * Math.cos(@rightAngle), @y + 0.05 * Math.sin(@rightAngle)]
    backAngle = @degreesToRadians(@heading + 180)
    points[points.length] = [@x + 0.05 * Math.cos(backAngle), @y + 0.05 * Math.sin(backAngle)]
    leftAngle = @degreesToRadians(@heading + 90)
    points[points.length] = [@x + 0.05 * Math.cos(leftAngle), @y + 0.05 * Math.sin(leftAngle)]
    return points
  putInPlane: (plane) ->
    @plane = plane
  degreesToRadians: (degs) ->
    return degs * (Math.PI / 180)
  radiansToDegrees: (rads) ->
    return rads * (180 / Math.PI)
this.Bug = Bug
