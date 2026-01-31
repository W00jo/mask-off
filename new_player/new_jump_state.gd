class_name NewJumpState
extends NewState


var jump_speed = -900

func enter():
	print("entering JUMP state...")
	owner.velocity.y = jump_speed
	owner.get_node("AnimationPlayer").play("jump")

func physics_update(delta:float):
	owner.velocity.y += 1500 * delta
	if owner.velocity.y > 0:
		state_machine.change_state("newfallstate")
		return
	
	var direction = Input.get_axis("ui_left","ui_right")
	
	if direction < 0:
		$"../../Sprite2D".flip_h = true
	elif direction > 0:
		$"../../Sprite2D".flip_h = false
	
	owner.velocity.x = direction * 200
	owner.move_and_slide()

	if owner.is_on_floor():
		if direction != 0:
			state_machine.change_state("newwalkstate")
			return
		else:
			state_machine.change_state("newidlestate")
			return
