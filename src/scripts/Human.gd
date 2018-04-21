extends Spatial

var z = Vector3(0,1,0)
enum direction { Up, Right, Down, Left }

var dir = direction.Up

export var speed = 0.5

func at_corner():
	return int(round(translation.x)) % 3 == 0 && int(round(translation.z)) % 3 == 0
 	
func _ready():
	$Tween.start()
	pass


func turn():
	dir = (dir + 1) % 4
	update_rot()
	
func update_rot(diff = 0):
	
	var rot = Vector3(0, (dir * 90) + diff, 0)
	tween_prop("rotation_degrees", rot, $Model)
	pass

	
func move(): 
	var movement = translation + Vector3(speed, 0, 0).rotated(z, deg2rad(dir * 90))
	tween_prop("translation", movement)

func tween_prop(prop, value, obj = self):
	$Tween.stop(obj, prop)	
	$Tween.interpolate_property(obj, prop, obj[prop], value, Global.bpm, Tween.TRANS_CUBIC, Tween.EASE_OUT, 0)
	