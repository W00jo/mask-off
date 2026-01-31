class_name NewWalkState
extends NewState

var speed = 150

func enter():
	print("entering WALK state...")
	owner.get_node("AnimationPlayer").play("walk")

func physics_update(_delta:float):
	
	if owner.is_on_floor():
		var direction = Input.get_axis("ui_left","ui_right")
		
		if direction < 0:
			$"../../Sprite2D".flip_h = true
		elif direction > 0:
			$"../../Sprite2D".flip_h = false
		
		if direction == 0:
				state_machine.change_state("newidlestate")
				return
				
		owner.velocity.x = direction * speed
		owner.move_and_slide()
	else:
		state_machine.change_state("newfallstate")
		return
	

func handle_input(event:InputEvent):
	if Input.is_action_just_pressed("ui_accept"):
		state_machine.change_state("newjumpstate")
	#if Input.is_action_pressed("Shift"):
		#state_machine.change_state("newrunstate")
