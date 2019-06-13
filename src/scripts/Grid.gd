extends Spatial

var block_size = 3.0
var block_scene = preload("res://Block.tscn")
var visible_blocks = 3

var map = Dictionary()

func _ready():
	place()
	pass

func beat():
	place()
	
func place():
	var pos = Global.player.global_transform.origin
	
	var p = Vector2(stepify(pos.x, block_size), stepify(pos.z, block_size))
	
	for i in _range(p.x):
		for j in _range(p.y):
			var b = Vector2(i, j)
			if !map.has(b):
				map[b] = add_block(b)
			
func _range(p):
	return range(p - visible_blocks * block_size, p + visible_blocks * block_size,  block_size)
	
func add_block(p):
	var block = block_scene.instance()
	block.translate(Vector3(p.x, 0, p.y))
	add_child(block)
	
	return block