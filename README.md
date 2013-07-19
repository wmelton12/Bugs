Bugs
====

Implementations of the Bug1 and Bug2 algorithms

Notes about implementation:
 * Need some way to sense and move around obstacles
  * solution: plane class which holds obstacles in an xy plane and can tell
    robots if they are colliding
    * Robot asks plane to move them to point, plane tells them if they collide?
    * Or robot asks plane if point is colliding with anything.
 * bug class
  * needs to move in a direction
  * know where goal is
  * calc line between position and goal
  * go around obstacle, calc closest point
  * follow obstacle
 * bug2
  * know starting position

