<?xml version="1.0" encoding="utf-8"?>
<!-- Created by Leo: http://leoeditor.com/leo_toc.html -->
<leo_file xmlns:leo="http://leoeditor.com/namespaces/leo-python-editor/1.1" >
<leo_header file_format="2" tnodes="0" max_tnode_index="0" clone_windows="0"/>
<globals body_outline_ratio="0.5" body_secondary_ratio="0.5">
	<global_window_position top="50" left="50" height="500" width="700"/>
	<global_log_window_position top="0" left="0" height="0" width="0"/>
</globals>
<preferences/>
<find_panel_settings/>
<vnodes>
<v t="amd.20160826110534.2"><vh>reeborg2016 版本</vh></v>
<v t="amd.20160826110805.1"><vh>@edit README.md</vh></v>
<v t="amd.20160826111026.1"><vh>@edit reeborg.html</vh></v>
<v t="amd.20160826111734.1"><vh>@edit index_en.html</vh></v>
<v t="amd.20160826111750.1"><vh>@edit index.html</vh></v>
<v t="amd.20160826143648.1" a="E"><vh>機器人指令</vh>
<v t="amd.20160826150826.1"><vh>右手扶牆走迷宮</vh></v>
</v>
<v t="amd.20160826144557.1" a="E"><vh>程式範例</vh>
<v t="amd.20160826144603.1"><vh>2D 繪圖</vh></v>
<v t="amd.20160826144753.1"><vh>2D 繪圖</vh></v>
<v t="amd.20160826151113.1"><vh>2D 繪圖</vh></v>
</v>
</vnodes>
<tnodes>
<t tx="amd.20160826110534.2">Welcome to the reeborg2016 wiki!

在近端 under_github 目錄中稱為 reeborg2016

希望利用 git remote add 功能, 在 bitbucket 建立一個同步倉儲 reeborg2016

在 bitbucket 仍使用 mdecourse At Gmail 登記帳號

研究重點:

分析 Reeborg 程式架構與技術
在 Github Pages 架構中, 建立網際應用
設法利用 Brython-Server 所使用的 Github API, redis, Flask, gunicorn, 增加網際程式版次管理
Reeborg doc 的架構是否沿用, 或者改用其他方法, 並增加中文繁體版說明</t>
<t tx="amd.20160826143648.1">Reeborg 指令

http://www.cmsimply.com/get_page?heading=Reeborg%20%E6%A9%9F%E5%99%A8%E4%BA%BA

建立機器人 robot: robot = UsedRobot(3, 5, 'E', 0), 在 x = 3, y = 5 的位置建立一個面向東方且沒有代幣的 robot

UsedRobot((x, y, orientation, tokens) 其中 (x, y) 為機器人所在座標, orientation 可以是 "E", "W", "S", "N" 其中之一, tokens 則是所攜帶的代幣個數.

假設利用 robot = UsedRobot(3, 5, 'E', 0) 建立機器人 robot, 則 robot 所在位置為 (robot.body.x, robot.body.y)

其他 robot 所具備的函式與屬性 (以 dir(robot) 取得):

robot = UsedRobot(3, 5, 'E', 0)
 
print(dir(robot))

['__bases__', '__class__', '__delattr__', '__dict__', '__dir__', '__doc__', '__eq__', '__format__', '__ge__', '__getattribute__', '__gt__', '__hash__', '__init__', '__le__', '__lt__', '__module__', '__name__', '__ne__', '__new__', '__or__', '__repr__', '__setattr__', '__str__', '__subclasshook__', 'at_goal', 'body', 'build_wall', 'carries_object', 'front_is_clear', 'is_facing_north', 'move', 'object_here', 'put', 'right_is_clear', 'set_model', 'set_trace_color', 'set_trace_style', 'take', 'turn_left', 'wall_in_front', 'wall_on_right']

world 的格式為 .json

{
  "robots": [
    {
      "x": 1,
      "y": 1,
      "orientation": 0,
      "_prev_x": 1,
      "_prev_y": 1,
      "_prev_orientation": 0
    }
  ],
  "walls": {},
  "description": "",
  "small_tiles": false,
  "rows": 12,
  "cols": 14,
  "objects": {
    "3,1": {
      "token": 1
    }
  }
}

機器人只能往前走

move() 向前移動一步

機器人只能向左轉

turn_left() 向左轉

UsedRobot() 建立 robot

機器人可以感測前方與右方是否有障礙物

front_is_clear() 前方沒有障礙

right_is_clear() 右方沒有障礙

機器人可以知道是否面向北

is_facing_north() 面向北

done() 完成

put() 放下呼叫器

take() 拿起呼叫器

shape_here()

select_world() 選擇環境

token_here() 這裡有代幣

has_token() 有代幣

at_goal() 達陣

at_goal_orientation() 達陣時方位

build_wall() 築牆

think() 思考 0-10000 milliseconds

pause() 暫停

remove_robot() 除去 robot

repeat() 重複

side_view() 側視

top_view() 上視

write() 寫出</t>
<t tx="amd.20160826144557.1">from browser import document as doc
from math import pi
 
canvas = doc["background-canvas"]
ctx = canvas.getContext('2d')
 
ctx.beginPath()
for i in range(5):
    for j in range(5):
        ctx.arc(100+50*j, 100+50*i, 20, 0, pi*2);
        ctx.closePath()
        ctx.fill()</t>
<t tx="amd.20160826144603.1">import math
from browser import html, doc
# use plotarea as canvas
canvas = doc["background-canvas"]
# 準備在 canvas 中繪圖
def draw_line(x1, y1, x2, y2, color="red"):
    ctx.beginPath()
    ctx.moveTo(x1, y1)
    ctx.lineTo(x2, y2)
    ctx.strokeStyle = color
    ctx.stroke()
# x, y 為中心,  r 為半徑, angle 旋轉角,  solid 空心或實心,  color 顏色
def star(x, y, r, angle=0, solid=False, color="#f00"):
    # 以 x, y 為圓心, 計算五個外點
    deg = math.pi/180
    # 圓心到水平線距離
    a = r*math.cos(72*deg)
    # a 頂點向右到內點距離
    b = (r*math.cos(72*deg)/math.cos(36*deg))*math.sin(36*deg)
    # 利用畢氏定理求內點半徑
    rin = math.sqrt(a**2 + b**2)
    # 查驗 a, b 與 rin
    #print(a, b, rin)
    if(solid):
        ctx.beginPath()
    for i in range(5):
        xout = (x + r*math.sin((360/5)*deg*i+angle*deg))
        yout = (y + r*math.cos((360/5)*deg*i+angle*deg))
        # 外點增量 + 1
        xout2 = x + r*math.sin((360/5)*deg*(i+1)+angle*deg)
        yout2 = y + r*math.cos((360/5)*deg*(i+1)+angle*deg)
        xin = x + rin*math.sin((360/5)*deg*i+36*deg+angle*deg)
        yin = y + rin*math.cos((360/5)*deg*i+36*deg+angle*deg)
        # 查驗外點與內點座標
        #print(xout, yout, xin, yin)
        if(solid):
            # 填色
            if(i==0):
                ctx.moveTo(xout, yout)
                ctx.lineTo(xin, yin)
                ctx.lineTo(xout2, yout2)
            else:
                ctx.lineTo(xin, yin)
                ctx.lineTo(xout2, yout2)
        else:
            # 空心
            draw_line(xout, yout, xin, yin, color)
            # 畫空心五芒星, 無關畫線次序, 若實心則與畫線次序有關
            draw_line(xout2, yout2, xin, yin, color)
    if(solid):
        ctx.fillStyle = color
        ctx.fill()

ctx = canvas.getContext('2d')
'''
size = 30
for i in range(size+1):
    # 水平線
    draw_line(100, 100+i*10, 100+size*10, 100+i*10, "black")
    # 垂直線from browser import document as doc
from math import pi
 
canvas = doc["background-canvas"]
ctx = canvas.getContext('2d')
 
ctx.beginPath()
ctx.arc(100, 100, 20, 0, pi*2);
ctx.closePath()
ctx.fill()
    draw_line(100+i*10, 100, 100+i*10, 100+size*10, "red")
'''
star(100, 100, 30, 0, True, "#f00")
#star(300, 300, 50, 0, False, "#000")
for i in range(5):
    for j in range(5):
        star(200+65*i, 200+65*j, 30, 0, False, "#000")</t>
<t tx="amd.20160826144753.1">from browser import document as doc
from math import pi
 
canvas = doc["background-canvas"]
ctx = canvas.getContext('2d')
 
def draw_circle(x, y, radius, color):
    ctx.fillStyle = color
    ctx.beginPath()
    ctx.arc(x, y, radius, 0, pi*2)
    ctx.closePath()
    ctx.fill()
 
# erase previous drawings
ctx.clearRect(0, 0, canvas.width, canvas.height)
 
draw_circle(100, 100, 20, 'red')
draw_circle(100, 400, 40, 'blue')
draw_circle(400, 100, 40, 'orange')
draw_circle(400, 400, 80, 'green')</t>
<t tx="amd.20160826150826.1">def turn_right():
    for i in range(3):
        turn_left()
 
while not at_goal():
    if not right_is_clear() and front_is_clear():
        move()
    elif right_is_clear():
        turn_right()
        move()
    else:
        turn_left()</t>
<t tx="amd.20160826151113.1">#coding: utf-8
from math import *
from browser import document as doc
import time
#import random
# 準備繪圖畫布
canvas = doc["background-canvas"]
ctx = canvas.getContext("2d")
# 定義座標轉換(0, 0) 到 (75, 20)
def change_ref_system(x, y):
    return (20 + x * 8, 420 - y * 20)
# 定義畫線函式
def draw_line(x1, y1, x2, y2, linethick = 3, color = "black"):
    ctx.beginPath()
    ctx.lineWidth = linethick
    ctx.moveTo(x1, y1)
    ctx.lineTo(x2, y2)
    ctx.strokeStyle = color
    ctx.stroke()
# 定義一個點類別
class Point:
    def __init__(self, x, y):
        self.x = x
        self.y = y
    def distanceTo(self, obj):
        if isinstance(obj, Point):
            return sqrt(pow(obj.x - self.x, 2) + pow(obj.y- self.y, 2))
        else:
            raise TypeError("Invalid type in Point.distanceTo()")
# 定義一個線類別
class Line:
    def __init__(self, p1, p2):
        self.p1 = p1
        self.p2 = p2
        # 定義一個 Line 的屬性 length
        self.length = self.p1.distanceTo(self.p2)
        self.deg = pi/180
    def rotate(self, angle):
        # 以 p1  為旋轉中心點
        # angle 為右手則旋轉角度
        # 這裡以左上角為原點, x 向右為正, y 向下為正
        self.p2.x = self.p1.x + self.length*cos(angle*self.deg)
        self.p2.y = self.p1.y - self.length*sin(angle*self.deg)
# 定義一個回呼繪圖函式
dataset = []
def graph():
    p1 = Point(0, 0)
    p2 = Point(10, 0)
    data = random.random() * 20
    doc["dataarea"] &lt;= '%s, ' % str(data)[0:5]
    dataset.append(data)
    if len(dataset) == 1:
        x, y = change_ref_system(len(dataset), data)
        draw_line(x, y, x, y, linethick=3, color="blue")
    else:
        x1, y1 = change_ref_system(len(dataset)-1, dataset[-2])
        x2, y2 = change_ref_system(len(dataset), data)
        draw_line(x1, y1, x2, y2, linethick=3, color="blue")
    if len(dataset) &gt;= 100:
        print(len(dataset))
        time.clear_interval(work)
p1 = Point(0, 0)
p2 = Point(10, 0)
p3 = Point(6.5, 7.8)
print("點 p1 到點 p2 的距離:", p1.distanceTo(p2))
line1 = Line(p1, p2)
print("線 line1 的長度:", line1.length)
# 以 p3 為圓心, 旋轉 90 度
line1.rotate(90)
#work = time.set_interval(graph, 100)
print("旋轉後, line1 的長度:", line1.length)
print("旋轉後, p1 的座標:", line1.p1.x, ",", line1.p1.y)
print("旋轉後, p2 的座標:", line1.p2.x, ",",  line1.p2.y)
x1, y1 = change_ref_system(0, 0)
for 索引 in range(0, 70, 4):
    x2, y2 = change_ref_system(索引, 20)
    draw_line(x1, y1, x2, y2, linethick=3, color="blue")
x1, y1 = change_ref_system(70, 0)
for 索引 in range(0, 70, 4):
    x2, y2 = change_ref_system(索引, 20)
    draw_line(x1, y1, x2, y2, linethick=3, color="red")</t>
</tnodes>
</leo_file>
