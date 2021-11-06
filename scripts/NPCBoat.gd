extends KinematicBody2D

export var turn_force2: float = 1
export var move_force2: float = 1

export var friction2: float = .3
export var radial_friction2: float = .2

var vel: Vector2 = Vector2.ZERO
var radial_vel: float = 0

var up: bool = false
var down: bool = false
var left: bool = false
var right: bool = false
var dash: bool = false
onready var mapsize = get_node("res://scenes/game.tscn").mapsize


# Called when the node enters the scene tree for the first time.
func _ready():
	 # Replace with function body.
	 # print(mapsize)
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
# Moved player control to only PlayerBoat

func _physics_process(delta):
	if left:
		radial_vel -= turn_force2
	if right:
		radial_vel += turn_force2
	var dir = Vector2.UP.rotated(rotation)
	if up:
		vel += dir * move_force2
	if down:
		vel -= dir * move_force2

	vel *= (1 - friction2)
	radial_vel *= (1 - radial_friction2)

	vel = move_and_slide(vel)
	rotate(radial_vel)
	#print(position.x, position.y)
	if position.x > mapsize.x:
		position.x = 0
	if position.x < 0:
		position.x = mapsize.x
	if position.y > mapsize.y:
		position.y = 0
	if position.y < 0:
		position.y = mapsize.y
	
func dash(power: float):
	var dir = Vector2.ZERO
