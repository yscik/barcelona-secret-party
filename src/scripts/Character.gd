extends Spatial

export var anim_count = 1

var animator
var anim_step
var anim_index = 0
	
func _ready():
	animator = $AnimationPlayer
	var a = animator.get_animation("default")
	animator.play("default")
	animator.stop()
	anim_step = a.length / anim_count
	
func animate():
	
	if anim_index == 0:
		animator.seek(0.0, true)
	
	$"../../Tween".interpolate_method(self, "anim_set", animator.current_animation_position, (anim_index + 1) * anim_step, Global.bpm * 0.8, Tween.TRANS_CUBIC, Tween.EASE_IN_OUT, 0)
	anim_index = (anim_index + 1) % anim_count

	
func anim_set(p):
	animator.seek(p, true)
	