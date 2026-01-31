extends Control

class_name Hud

@onready var player_displays: Array[PlayerDisplay] = [
	$MarginContainer/HBoxContainer/Player1Display,
	$MarginContainer/HBoxContainer/Player2Display,
	$MarginContainer/HBoxContainer/Player3Display,
	$MarginContainer/HBoxContainer/Player4Display
]

# Max HP
var max_health = 100

func get_displays() -> Array[PlayerDisplay]:
	return player_displays
