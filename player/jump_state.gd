class_name JumpState
extends State


var jump_speed = -900

func enter():
	print("entering JUMP state...")
	owner.velocity.y = jump_speed
	owner.get_node("AnimationPlayer").play("player_temp_jump")

func physics_update(delta:float):
	owner.velocity.y += 1500 * delta
	if owner.velocity.y > 0:
		state_machine.change_state("fallstate")
		return
	
	var direction = Input.get_axis(input.move_left, input.move_right)
	
	if direction < 0:
		$"../../Sprite2D".flip_h = true
	elif direction > 0:
		$"../../Sprite2D".flip_h = false
	
	owner.velocity.x = direction * 200
	owner.move_and_slide()

	if owner.is_on_floor():
		if direction != 0:
			state_machine.change_state("walkstate")
			return
		else:
			state_machine.change_state("idlestate")
			return
