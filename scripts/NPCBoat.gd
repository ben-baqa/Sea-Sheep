extends "res://scripts/boat.gd"

var activity: int = 0
var actionframes: int = 0
var desired_dir: float = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	up = true

func _process(delta):
	if get_slide_count() >= 1 and activity > 30:
		print("Collided! my direction changes")
		desired_dir = -(desired_dir + 3*randf()-1.5)
		activity = -30
	
	activity += 1
	if (randi() % 300) < activity:
		if activity % 3 == 0:
			print("new desired dir! ") 
			desired_dir += (2*randf()-1)
			if abs(desired_dir) > 3.3:
				desired_dir *= -1
			print(desired_dir)
			activity = 0
	
	if abs(desired_dir - rotation) >= turn_force * 10:
		if sign(desired_dir - rotation) == 1:
			left = false
			right = true
			print("rotating right! difference is", (desired_dir - rotation))
		else:
			right = false
			left = true
			print("rotating left! difference is", (desired_dir - rotation))
	else:
		right = false
		left = false
