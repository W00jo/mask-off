class_name IdleStateMachine
extends State


func _enter():
	print("Stoje")
	owner.velocity.x = 0
	owner.velocity.y = 0
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_left") or event.is_action_pressed("ui_right") or event.is_action_pressed("ui_down"):
		transition.emit("WalkingStateMachine")
		return
	elif event.is_action_pressed("ui_up"):
		print("zaraz bede skakał")
		transition.emit("JumpStateMachine")
func _physics_update(_delta: float) -> void:
	owner.velocity.y = 10000 * _delta
	owner.move_and_slide()
	
	
