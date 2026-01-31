@tool
extends Control

class_name PlayerDisplay

@export var label_name: String = "" : set = set_label_name

func set_label_name(value: String):
	label_name = value
	var label = $VBoxContainer/HBoxContainer/PlayerLabel
	label.text = value

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass 
