extends Control

signal start_pressed


func _on_start_pressed() -> void:
	start_pressed.emit()

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://src/ui/menus/main_menu.tscn")
