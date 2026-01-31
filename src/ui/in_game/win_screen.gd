extends Control

signal new_game_pressed
signal back_to_menu_pressed

func _on_new_game_pressed() -> void:
	new_game_pressed.emit()

func _on_back_to_menu_pressed() -> void:
	back_to_menu_pressed.emit()
