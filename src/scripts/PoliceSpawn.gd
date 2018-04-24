extends Spatial

var police = preload("res://Police.tscn")
func _ready():
	pass

func party():
	$"..".add_child(police.instance())
	