@tool
extends Control

class_name PlayerDisplay

@export var label_name: String = "" : set = set_label_name
@onready var health_bar: ProgressBar = $VBoxContainer/HealthBar

func set_label_name(value: String):
	label_name = value
	var label = $VBoxContainer/HBoxContainer/PlayerLabel
	label.text = value
	
func set_current_health(health: int):
	health_bar.value = health
	
func set_max_health(max_health: int):
	health_bar.max_value = max_health
	health_bar.value = max_health

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass 
