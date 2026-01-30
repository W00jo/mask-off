class_name JumpStateMachine
extends State

var jump_speed : float = -1000.0


func _enter():
	print("skacze")
	owner.velocity.y = jump_speed

func _physics_update(_delta: float) -> void:
	var direction = Input.get_axis("ui_left", "ui_right")
	owner.velocity.y += 4000 * _delta
	
	owner.velocity.x = direction * 200
	owner.move_and_slide()
	
	if owner.is_on_floor():
			transition.emit("IdleStateMachine")
			
		
	
