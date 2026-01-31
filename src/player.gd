extends CharacterBody2D

#@export var speed = 400


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta 
		
func _ready():
	$StateMachine.set_input_data(InputData.new(
		"ui_left", "ui_right", "ui_accept", "z"
	))
