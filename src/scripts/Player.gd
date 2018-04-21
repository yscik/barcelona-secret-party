extends "res://scripts/Human.gd"

var black = Color(0, 0, 0, 0)
export (Array, Color) var colors
var turning = false


func _unhandled_key_input(key):
	if key.pressed && key.scancode == KEY_SPACE:
		turning = true
	
func beat():
	if turning:
		turn()
		if !at_corner():
			turn()
	else:
		move()

	turning = false		
	flash()
		
	pass

func flash():
	
	var color = colors[rand_range(0, colors.size() - 1)]
#	$Light.light_color = color
#	$Light/Anim.play("Flash")
	print(color.to_html(false))
	$Tween.interpolate_property($Light, "light_color", color, black, Global.bpm / 2, Tween.TRANS_CUBIC, Tween.EASE_IN_OUT, 0)
	$Tween.interpolate_property($Light2, "light_color", color, black, Global.bpm / 2, Tween.TRANS_CUBIC, Tween.EASE_IN_OUT, 0)
	$Tween.interpolate_property($Light3, "light_color", color, black, Global.bpm / 2, Tween.TRANS_CUBIC, Tween.EASE_IN_OUT, 0)
	
	