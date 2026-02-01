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

func hide_play_game_popup():
	play_game_popup.hide()
	
func hide_player_display(index: int):
	player_displays[index].hide()
	
func reset():
	for i in 4:
		player_displays[i].show()
		player_displays[i].reset()
