# Implementation of the Bug 1 algorithm
## Task find a path between the Robot and a goal, going around obstacles
* The Robot moves toward the goal until it reaches the obstacle
* The Robot then circumnavigates the obstacle and finds the point on the obstacle     
* The Robot then goes to that point and resumes traveling toward the goal.

The Code extends the class Bug

    class Bug1 extends Bug
        constructor: (@x,@y,@gx,@gy) ->
                super @x,@y #Pass the values along to the constructor
                @wallFollowing = false
                @firstLap = true
                @heading = 0
                @shortestPoint = []
                @encounteredObj = []
                
        turnLeft: ()->
                #console.log(@heading)
             @heading+=1
          turnRight: ()->
                #console.log(@heading)
             @heading-=1
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
            	
          frontIsClear: ()->
              console.log("Bug1 heading: " + @heading)
              refPoints = @getRefPoints(@heading)
              if @plane != null
                  return !@plane.checkCollision(refPoints[0]...)
              else
                  return false
          rightIsClear: ()->
              refPoints = @getRefPoints()
              if @plane != null
                  return !@plane.checkCollision(refPoints[1])
              else
                  return false
          backIsClear: ()->
              refPoints = @getRefPoints()
              if @plane != null
                  return !@plane.checkCollision(refPoints[2])
              else
                  return false
          leftIsClear: ()->
              refPoints = @getRefPoints()
              if @plane != null
                  return !@plane.checkCollision(refPoints[3])
              else
                  return false
          orientTowardsGoal: ()->
              @heading = @radiansToDegrees(Math.atan((@gy - @y) / (@gx - @x)))
          atPoint: (px,py) ->
              return @dist(@x,@y,px,py) < 0.05
          atGoal: ()->
              return @atPoint(@gx,@gy)
          dist: (x1,y1,x2,y2) ->
                  return Math.sqrt(Math.pow(x2-x1,2) + Math.pow(y2-y1,2))
          printPlane: () ->
            console.log @plane #to make sure objects could use their parent's data members as their own (not known to me)
        this.Bug1 = Bug1
