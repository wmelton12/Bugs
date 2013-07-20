class Bug
  constructor: (@x,@y) ->
    @plane = null
  move: ()->
  putInPlane: (plane) ->
    @plane = plane
