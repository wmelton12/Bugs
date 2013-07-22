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
            @shortestPoint = []
          move: () ->
          	refPoints = @getRefPoints()
          	if(!@wallFollowing)
          		if(@plane.checkCollision(refPoints[0]...)
          			@wallFollowing = true
          			while(!@plane.checkCollison(refPoints[1]...))
          				@heading -= 1
          			
          			toMove = [@x + 0.001 * Math.cos(@degreesToRadians(@heading)), @y + 0.001 * Math.sin(@degreesToRadians(@heading))]
          			@x = toMove[0]
          			@y = toMove[1]
          		else
          			@x = refPoints[0][0]
          			@y = refPoint[0][1]
          	else
          		if(firstLap)
          			if(@shortestPoint.length == 0)
          				@shortestPoint = [@x,@y]
          			else if(@dist(@x,@y,@gx,@gy) < @dist(@shortestPoint[0],@shortestPoint[1], @gx, @gy)
          				@shortestPoint = [@x,@y]
          			while(!@plane.checkCollison(refPoints[1]...))
          				@heading -= 1
          			while(@plane.checkCollision(refPoints[0]))
          				@heading += 1
          			toMove = [@x + 0.001 * Math.cos(@degreesToRadians(@heading)), @y + 0.001 * Math.sin(@degreesToRadians(@heading))]
          			@x = toMove[0]
          			@y = toMove[1]
          dist: (x1,y1,x2,y2) ->
          		return Math.sqrt(Math.pow(x2-x1,2) + Math.pow(y2-y1,2))
          printPlane: () ->
            console.log @plane #to make sure objects could use their parent's data members as their own (not known to me)
        this.Bug1 = Bug1
