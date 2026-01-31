class_name WalkState
extends State

var speed = 150

func enter():
	print("entering WALK state...")
	owner.get_node("AnimationPlayer").play("player_temp_walk")

func physics_update(_delta:float):
	
	if owner.is_on_floor():
		var direction = Input.get_axis(input.move_left,input.move_right)
		
		if direction < 0:
			$"../../Sprite2D".flip_h = true
		elif direction > 0:
			$"../../Sprite2D".flip_h = false
		
		if direction == 0:
				state_machine.change_state("idlestate")
				return
				
		owner.velocity.x = direction * speed
		owner.move_and_slide()
	else:
		state_machine.change_state("fallstate")
		return
		
func handle_input(event:InputEvent):
	if Input.is_action_just_pressed(input.jump):
		state_machine.change_state("jumpstate")
	if Input.is_action_pressed("Shift"):
		state_machine.change_state("runstate")
