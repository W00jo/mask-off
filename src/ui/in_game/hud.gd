extends Control

class_name Hud

@onready var player_displays: Array[PlayerDisplay] = [
	$MarginContainer/HBoxContainer/Player1Display,
	$MarginContainer/HBoxContainer/Player2Display,
	$MarginContainer/HBoxContainer/Player3Display,
	$MarginContainer/HBoxContainer/Player4Display
]
@onready var play_game_popup := $PlayGamePopup

# Max HP
var max_health = 100

func show_play_game_popup():
	play_game_popup.visible = true
	$PlayGamePopup/AnimationPlayer.play("play_game_popup")
