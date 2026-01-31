class_name NewIdleState
extends NewState

func enter():
	print("entering IDLE state...")
	#owner.get_node("AnimationPlayer").play("idle")

func handle_input(_event:InputEvent):
	if Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right"):
		state_machine.change_state("newwalkstate")
		return
	elif Input.is_action_just_pressed("ui_accept"):
		state_machine.change_state("newjumpstate")
		return
