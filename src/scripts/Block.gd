extends Spatial

var effects = preload("res://HouseParty.tscn")

var party_on = false
func _ready():
	rotation_degrees.y = (randi() % 4) * 90.0
	pass

func start_party():
	party_on = true
	var party = effects.instance()
	add_child(party)
	get_tree().call_group("Party", "party")

func has_player(area):
	if !party_on:
		start_party()
		
func beat():
	pass