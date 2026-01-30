extends CharacterBody2D


#@export var speed = 400


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
#func _physics_process(delta):
	#if Input.is_action_pressed("ui_left", "ui_right", "ui_up", "ui_down")
	
