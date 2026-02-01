extends Control

class_name WinScreen

signal new_game_pressed
signal back_to_menu_pressed

func set_winner(player: Player):
	$WinnerPic.modulate = player.player_color

func _on_new_game_pressed() -> void:
	new_game_pressed.emit()

func _on_back_to_menu_pressed() -> void:
	back_to_menu_pressed.emit()
