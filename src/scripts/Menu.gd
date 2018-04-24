extends ViewportContainer

var game = preload("res://Game.tscn") 
func _ready():
	pass


func start():
	get_tree().change_scene_to(game)


func quit():
	get_tree().quit()
