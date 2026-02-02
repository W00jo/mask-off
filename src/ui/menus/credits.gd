extends Control

signal back_pressed

func _ready():
	pass

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://src/ui/menus/main_menu.tscn")
