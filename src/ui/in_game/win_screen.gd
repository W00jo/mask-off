extends Control

class_name WinScreen

signal on_new_game_pressed
signal on_back_to_menu_pressed

func set_winner(player: Player):
	$WinnerPic.modulate = player.player_color
	$StickyNote.modulate = player.player_color

func _on_new_game_pressed() -> void:
	on_new_game_pressed.emit()

func _on_back_to_menu_pressed() -> void:
	on_back_to_menu_pressed.emit()
