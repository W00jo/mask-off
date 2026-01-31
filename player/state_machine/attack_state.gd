class_name DeathState
extends State


var jump_speed = -900


func enter():
	print("entering ATTACK state...")
	
	owner.current_attack.start_attack(owner)
	await owner.current_attack.attack_finished
	
	if(Input.get_axis(input.move_left,input.move_right) != 0):
		state_machine.change_state("walkstate")
	elif(owner.velocity.y > 0):
		state_machine.change_state("fallstate")
	else:
		state_machine.change_state("idlestate")
