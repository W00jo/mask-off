extends Control

signal resume_pressed

func _on_resume_pressed() -> void:
	resume_pressed.emit()


func _on_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://src/ui/menus/main_menu.tscn")


func _on_exit_pressed() -> void:
	get_tree().quit()
