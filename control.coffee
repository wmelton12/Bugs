alert("hello")
draw = SVG('canvas').size(500,500)

p = new Plane(draw)

obs1list = [[100,100],[100,200],[200,200],[200,100]]

obs = p.addObstacle(obs1list)

alert(obs.intersectsPoint(150,150))
