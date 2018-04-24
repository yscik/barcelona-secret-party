extends Spatial

var black = Color(0, 0, 0, 0)
export (Array, Color) var colors
export (ShaderMaterial) var raymat

func _ready():
	visible = false
	$Tween.start()
	pass
	
func beat():
	flash()


func flash():
	visible = true

	var color = colors[rand_range(0, colors.size() - 1)]
	
	$Tween.interpolate_method(self, "set_color", color, black, Global.bpm, Tween.TRANS_CUBIC, Tween.EASE_IN_OUT, 0)
	yield($Tween, "tween_completed")

	
func set_color(color):
	$Light.light_color = color
	raymat.set_shader_param("color", color)
	