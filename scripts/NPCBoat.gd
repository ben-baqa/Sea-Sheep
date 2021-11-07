extends "res://scripts/boat.gd"

var activity: int = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	up = true

func _process(delta):
	activity += 1 
