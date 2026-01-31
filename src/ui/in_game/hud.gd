extends Control

@onready var player_displays = [
	$MarginContainer/HBoxContainer/Player1Display,
	$MarginContainer/HBoxContainer/Player2Display,
	$MarginContainer/HBoxContainer/Player3Display,
	$MarginContainer/HBoxContainer/Player4Display
]

# Max HP
var max_health = 100
