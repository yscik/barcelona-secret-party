extends Spatial

func _ready():
	cull()
	pass

func beat():
	cull()
	
func cull():
	
	var playerpos = Global.player.global_transform.origin
	for block in get_children():
		if block.is_class('InstancePlaceholder'):
			block.replace_by_instance()
		else:
			block.visible = block.global_transform.origin.distance_to(playerpos) < 10
	