extends Control

signal resume_pressed

func _on_resume_pressed() -> void:
	resume_pressed.emit()


func _on_menu_pressed() -> void:
	pass # Replace with function body.


func _on_exit_pressed() -> void:
	pass # Replace with function body.
