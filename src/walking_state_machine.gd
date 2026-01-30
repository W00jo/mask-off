class_name WalkingStateMachine
extends State

@export var SPEED = 400

func _enter():
	print("ide")

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	owner.velocity = direction * SPEED
	
	owner.move_and_slide()
func _exit():
	pass
	

	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
