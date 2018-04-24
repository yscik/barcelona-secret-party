extends "res://scripts/Human.gd"

signal busted

var black = Color(0, 0, 0, 0)

var turning = null
var input = {
	ui_up = direction.Up,	
	ui_down = direction.Down,	
	ui_left = direction.Left,	
	ui_right = direction.Right,	
}

func _ready():
	Global.player = self

func _process(dt):
	
	for action in input:
		if Input.is_action_pressed(action):
			turning = input[action]
		
func beat():
	
	if turned_back:
		move()
		turned_back = false
	
	elif !hits_wall():
		control()
	
	
	$Model/Character.animate()
		
	pass
	
func control():
	if turning != null && turning != dir:
		dir = turning
		update_rot()
		dance_rot = 0
	else:
		dance()

	move()

	turning = null
	

var turned_back = false

func hits_wall():
	
	if !turned_back && check_walls():
		turned_back = true
		turn_back()
		return true
	return false
		
func check_walls():
	var areas = $Area.get_overlapping_areas()
	for area in areas:
		if area.get_collision_layer_bit(2):
			return true
	return false
	
	
func turn_back():
	dir = dir + 2 % 4
	update_rot()
	

func busted(area):
	$"..".end()


var dance_rot = 0

func dance():
	
	dance_rot = dance_rot + (1 if randf() > 0.5 else -1)
	
	update_rot(dance_rot * 25)
