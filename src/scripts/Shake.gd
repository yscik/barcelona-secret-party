extends ColorRect

func _ready():
	$Tween.start()
	pass

func beat():
	$Tween.interpolate_method(self, "set_scale", 0, 2.0, Global.bpm/2, Tween.TRANS_BOUNCE, Tween.EASE_OUT, 0)
	yield($Tween, "tween_completed")
	set_scale(0)
	
func set_scale(scale):
	material.set_shader_param("scale", scale)
	