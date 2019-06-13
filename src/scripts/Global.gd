extends Node

var bpm = 1.72 / 4.0 

var player

var start = false

func _ready():
		
	if OS.has_feature("web"):
		OS.window_maximized = true