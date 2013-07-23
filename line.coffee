# represents a line
#   stores x1,y1,x2,y2, m and d

class Line
  constructor:(@x1,@y1,@x2,@y2,@draw,@drawLine = true) ->
    if @drawLine then @draw.line(@x1,@y1,@x2,@y2).stroke({ width: 1, color: 'red' })
    @m = (@y2 - @y1) / (@x2 - @x1)
    @d = @y1 - @m * @x1
  intersection: (other) ->
    
    if ( @m == other.m && @d == other.d)
      return true
    else if ( @m == other.m && @d != other.d)
      return false
    else 
      x = (other.d - @d) / (@m - other.m)
      y = @m * x + @d
    return [x,y]

  passesThroughLine: (other) -> 
    [x, y] = @intersection(other)
    if( (@x1 < x < @x2  || @x2 < x < @x1) && (@y2 < y < @y1 || @y2 < y < @y1) && (other.x1 < x < other.x2 || other.x2 < x < other.x1) && (other.y1 < y < other.y2 || other.y2 < y < other.y1) )
      return true
    else
      return false
this.Line=Line
