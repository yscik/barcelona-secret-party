extends "res://scripts/Human.gd"

func _ready():
	pass

func beat():
	
	var turn = get_turn()

	if at_corner() && turn != dir: 
		dir = turn
		
	else:
		searchlight()
		move()

	update_rot(dir)
		

	$Model/Character.animate()
		
var light_dir = 0

func searchlight():
	
	light_dir = randi() % 3 - 1 if light_dir == 0 else 0
	
	update_rot(light_dir * 25)

func get_turn():
	var distance = Global.player.translation - self.translation

	if distance.length() > 6:
		return random_turn()
		
	elif abs(distance.x) > abs(distance.z):
		# turn left/right
		return direction.Right if distance.x > 0 else direction.Left
	else: 
		# turn up/down
		return direction.Up if distance.z < 0 else direction.Down
	
	
func toggle_flashlight():
	$Model/Light.light_energy = 16
	
func random_turn():
	var change = randi() % 3 - 1
	return (dir + change) % 4
	
