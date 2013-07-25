test
	
		move: () ->         
              if(!@wallFollowing)
                  if(@frontIsClear())
                      @orientTowardsGoal()
                      @x = @x + 0.05 * Math.cos(@degreesToRadians(@heading))
                      @y = @y + 0.05 * Math.sin(@degreesToRadians(@heading))
                  else
                      @wallFollowing = true
                      if @rightIsClear()
                          while(@rightIsClear())
                              @turnRight()
                      else if !@frontIsClear()
                          while(!@frontIsClear())
                              @turnLeft()
                      @x = @x + 0.05 * Math.cos(@degreesToRadians(@heading))
                      @y = @y + 0.05 * Math.sin(@degreesToRadians(@heading))
                      @shortestPoint = [@x,@y]
                      @encounteredObj = [@x,@y]
              else
                  if @rightIsClear()
                      while(@rightIsClear())
                          @turnRight()
                  else if !@frontIsClear()
                      while(!@frontIsClear())
                          @turnLeft()
                @x = @x + 0.05 * Math.cos(@degreesToRadians(@heading))
                @y = @y + 0.05 * Math.sin(@degreesToRadians(@heading))
                if(@firstLap)
                    if(@atPoint(@encounteredObj...))
                        @firstLap = false
                    if(@dist(@x,@y,@gx,@gy) < @dist(@shortestPoint[0],@shortestPoint[1],@gx,@gy))
                        @shortestPoint = [@x,@y]
                    if(@atPoint(@encounteredObj))
                        @firstLap = false
                else
                    if(@atPoint(@shortestPoint...))
                        @orientTowardsGoal()
                        @wallFollowing=false
                        @firstLap = true
                        @x = @x + 0.05 * Math.cos(@degreesToRadians(@heading))
                        @y = @y + 0.05 * Math.sin(@degreesToRadians(@heading))
            	if @plane != null then @plane.drawPoint(@x,@y)