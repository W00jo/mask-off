class_name IdleState
extends State

func enter():
	print("entering IDLE state...")
	owner.get_node("AnimationPlayer").play("player_temp_idle")

func handle_input(_event:InputEvent):
	if Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right"):
		state_machine.change_state("walkstate")
		return
	elif Input.is_action_just_pressed("ui_accept"):
		state_machine.change_state("jumpstate")
		return
