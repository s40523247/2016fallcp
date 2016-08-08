# 開始透過 ggame 程式庫進行網際繪圖
# ggame 手冊
# http://brythonserver.github.io/ggame/
'''
from ggame import App, Color, LineStyle, Sprite
from ggame import RectangleAsset, CircleAsset, EllipseAsset, PolygonAsset

# Three primary colors with no transparency (alpha = 1.0)
red = Color(0xff0000, 1.0)
green = Color(0x00ff00, 1.0)
blue = Color(0x0000ff, 1.0)
black = Color(0x000000, 1.0)

# Define a line style that is a thin (1 pixel) wide black line
thinline = LineStyle(1, black)
# A graphics asset that represents a rectangle
rectangle = RectangleAsset(50, 20, thinline, blue)

# Now display a rectangle
Sprite(rectangle)

myapp = App()
myapp.run()
'''
'''
###############################################
from ggame import App, ImageAsset, Sprite

# Create a displayed object at 0,0 using an image asset
Sprite(ImageAsset("ggame/bunny.jpg"), (0,0))
# Create the app, with a 500x500 pixel stage
app = App(500,500)  
# Run the app
app.run()
'''
'''
###############################################
from ggame import App, Color, LineStyle, Sprite
from ggame import RectangleAsset, CircleAsset, EllipseAsset, PolygonAsset

# Three primary colors with no transparency (alpha = 1.0)
white = Color(0xE3E3E3, 1.0)
yellow = Color(0xEDF55F, 1.0)
blue = Color(0x0000FF, 1.0)
green = Color(0x84F564, 1.0)
black = Color(0x4D4843, 1.0)

# Define a line style that is a thin (1 pixel) wide black line
thinline = LineStyle(1, black)
# A graphics asset that represents a rectangle
rectangle = RectangleAsset(400, 200, thinline, green)
ellipse = EllipseAsset(30, 30, thinline, yellow)
ellipse2 = EllipseAsset(70, 40, thinline, blue)
polygon = PolygonAsset([(-85, 100), (25, -75), (100, 125), (-85, 100)], thinline, black)
polygon2 = PolygonAsset([(100, 100), (225, -125), (350, 125), (100, 100)], thinline, black)
# Now display a rectangle
Sprite(rectangle, (100, 200))
Sprite(ellipse, (75, 40))
Sprite(ellipse2, (325, 325))
Sprite(polygon, (150, 150))
Sprite(polygon2, (150, 150))

myapp = App()
myapp.run()
'''
#############################################
"""
picture.py
Author: <Hayden Hatfield>
Credit: <list sources used, if any>

Assignment:Picture

Use the ggame library to "paint" a graphical picture of something (e.g. a house, a face or landscape).

Use at least:
1. Three different Color objects.
2. Ten different Sprite objects.
3. One (or more) RectangleAsset objects.
4. One (or more) CircleAsset objects.
5. One (or more) EllipseAsset objects.
6. One (or more) PolygonAsset objects.

See:
https://github.com/HHS-IntroProgramming/Standards-and-Syllabus/wiki/Displaying-Graphics
for general information on how to use ggame.

See:
http://brythonserver.github.io/ggame/
for detailed information on ggame.

"""
from ggame import App, Color, LineStyle, Sprite, RectangleAsset, CircleAsset, EllipseAsset, PolygonAsset

# add your code here \/  \/  \/

red = Color(0xff0000, 1.0)
green = Color(0x00ff00, 1.0)
blue = Color(0x0000ff, 1.0)
black = Color(0x000000, 1.0)
darkgreen = Color(0x0e270f, 1.0)
nightsky = Color(0x16152b, 1.0)
ground = Color(0x06471a, 1.0)
wood = Color(0x542a0c, 1.0)
moonwhite = Color(0xfff3aa, 1.0)
grey = Color(0x818181, 1.0)
line = LineStyle(2, black)


trunk = RectangleAsset( 20, 50, line, wood )
tri13 = PolygonAsset([(0,100),(200,100),(100,0)], line, darkgreen )
tri14 = PolygonAsset([(0,100),(200,100),(100,0)], line, darkgreen )
tri15 = PolygonAsset([(0,100),(200,100),(100,0)], line, darkgreen )
tri16 = PolygonAsset([(0,100),(200,100),(100,0)], line, darkgreen )
trunk = RectangleAsset( 20, 50, line, wood )
tri9 = PolygonAsset([(0,100),(200,100),(100,0)], line, darkgreen )
tri10 = PolygonAsset([(0,100),(200,100),(100,0)], line, darkgreen )
tri11 = PolygonAsset([(0,100),(200,100),(100,0)], line, darkgreen )
tri12 = PolygonAsset([(0,100),(200,100),(100,0)], line, darkgreen )
trunk = RectangleAsset( 20, 50, line, wood )
tri5 = PolygonAsset([(0,100),(200,100),(100,0)], line, darkgreen )
tri6 = PolygonAsset([(0,100),(200,100),(100,0)], line, darkgreen )
tri7 = PolygonAsset([(0,100),(200,100),(100,0)], line, darkgreen )
tri8 = PolygonAsset([(0,100),(200,100),(100,0)], line, darkgreen )
trunk = RectangleAsset( 20, 50, line, wood )
tri1 = PolygonAsset([(0,100),(200,100),(100,0)], line, darkgreen )
tri2 = PolygonAsset([(0,100),(200,100),(100,0)], line, darkgreen )
tri3 = PolygonAsset([(0,100),(200,100),(100,0)], line, darkgreen )
tri4 = PolygonAsset([(0,100),(200,100),(100,0)], line, darkgreen )
moon = EllipseAsset(40, 40, line, moonwhite )
rock = CircleAsset(75, line, grey)
background = RectangleAsset( 1000, 1000, line, nightsky )
ground = RectangleAsset( 1000, 100, line, ground )

Sprite(background, (0, 0))
Sprite(tri9, (450, 575))
Sprite(tri10, (450, 525))
Sprite(tri11, (450, 475))
Sprite(tri12, (450, 425))
Sprite(trunk, (540, 675))

Sprite(tri13, (250, 550))
Sprite(tri14, (250, 500))
Sprite(tri15, (250, 450))
Sprite(tri16, (250, 400))
Sprite(trunk, (340, 650))

Sprite(tri5, (150, 575))
Sprite(tri6, (150, 525))
Sprite(tri7, (150, 475))
Sprite(tri8, (150, 425))
Sprite(trunk, (240, 675))

Sprite(tri1, (20, 550))
Sprite(tri2, (20, 500))
Sprite(tri3, (20, 450))
Sprite(tri4, (20, 400))
Sprite(trunk, (110, 650))
Sprite(moon, (900, 50))
Sprite(rock, (925, 700))
Sprite(ground, (0, 700))
# add your code here /\  /\  /\


myapp = App()
myapp.run()
