extends KinematicBody2D

export var turn_force: float = 1
export var move_force: float = 1

export var friction: float = .3
export var radial_friction: float = .2

var vel: Vector2 = Vector2.ZERO
var radial_vel: float = 0

var up: bool = false
var down: bool = false
var left: bool = false
var right: bool = false
var dash: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	up = Input.is_action_pressed("up")
	down = Input.is_action_pressed("down")
	left = Input.is_action_pressed("left")
	right = Input.is_action_pressed("right")
	dash = dash || Input.is_action_just_pressed("dash")

func _physics_process(delta):
	if left:
		radial_vel -= turn_force
	if right:
		radial_vel += turn_force
	var dir = Vector2.UP.rotated(rotation)
	if up:
		vel += dir * move_force
	if down:
		vel -= dir * move_force

	vel *= (1 - friction)
	radial_vel *= (1 - radial_friction)

	vel = move_and_slide(vel)
	rotate(radial_vel)

func dash(power: float):
	var dir = Vector2.ZERO
