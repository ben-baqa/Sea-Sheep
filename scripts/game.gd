extends Node2D


# Declare member variables here. Examples:

# We would change these depending on the map and the environment itself.
var mapsize = Vector2(4096,2400)
onready var boat1 = $PlayerBoatGroup/PlayerBoat
onready var boat2 = $NPCBoatGroup/NPCBoat

onready var b1 = boat1.position
onready var b2 = boat2.position
var distance = Vector2()
var distance_string = "Distance:"
var display_distance = ""

onready var GUI = get_node("GUI")
onready var textdisplay = get_node("GUI/ColorRect/BoatDistanceCalculator")

# Called when the node enters the scene tree for the first time.
func _ready():
	mapsize = Vector2(4096,2400)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	b1 = boat1.position
	b2 = boat2.position
	distance.x = min(abs(b1.x-b2.x),abs(mapsize.x-b1.x-b2.x))
	distance.y = min(abs(b1.y-b2.y),abs(mapsize.y-b1.y-b2.y))


	#really bad code here
	GUI.position.x = b1.x
	GUI.position.y = b1.y + 250
	
	
	
	
	display_distance = (distance.length() / 40)
	
	if display_distance < 10:
		distance_string = "Very Close!"
	else:
		distance_string = "Distance: %d" % display_distance
	textdisplay.text = distance_string
