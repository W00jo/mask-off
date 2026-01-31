class_name NewFallState
extends NewState


func enter():
	print("entering FALL state...")
	owner.velocity.y = 0
	#$"../../Sprite2D".frame = 28

func physics_update(delta:float):
	owner.velocity.y += 980 * delta
	
	var direction = Input.get_axis("ui_left","ui_right")
	
	if direction < 0:
		$"../../Sprite2D".flip_h = true
	elif direction > 0:
		$"../../Sprite2D".flip_h = false
	
	owner.velocity.x = direction * 200
	owner.move_and_slide()

	if owner.is_on_floor():
		#owner.get_node("AnimationPlayer").play("land")
		#await $"../../AnimationPlayer".animation_finished
		if direction != 0:
			state_machine.change_state("newwalkstate")
			return
		else:
			state_machine.change_state("newidlestate")
			return
