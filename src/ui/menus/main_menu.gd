extends Control

signal play_pressed
signal instruction_pressed
signal options_pressed
signal credits_pressed
signal exit_pressed




func _on_play_pressed() -> void:
	play_pressed.emit()

func _on_instruction_pressed() -> void:
	instruction_pressed.emit()

func _on_options_pressed() -> void:
	options_pressed.emit()

func _on_credits_pressed() -> void:
	credits_pressed.emit()

func _on_exit_pressed() -> void:
	exit_pressed.emit()
	

func _on_howtoplay_pressed() -> void:
	get_tree().change_scene_to_file("res://src/ui/menus/how_to_play.tscn")
