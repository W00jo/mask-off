class_name AttackState
extends State

var jump_speed = -900


func enter():
	print("entering ATTACK state...")
	
	owner.current_attack.start_attack(owner)
	await owner.current_attack.attack_finished
	
	if(owner.velocity.y > 0):
		state_machine.change_state("fallstate")
	elif(Input.get_axis(input.move_left,input.move_right) != 0):
		state_machine.change_state("walkstate")
	else:
		state_machine.change_state("idlestate")
