class_name WalkingStateMachine
extends State

var SPEED : float = 400

func _enter():
	print("ide")

func _physics_update(delta: float) -> void:
	print("działam")
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		if owner.is_on_floor():
			print("direction: ",direction)
			print("spd:", SPEED)
			owner.velocity.x = direction * SPEED
			owner.move_and_slide()
	else:
		transition.emit("IdleStateMachine")
		return
	if Input.is_action_just_pressed("ui_up"):
		transition.emit("JumpStateMachine")
func _exit():
	pass
	

	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
