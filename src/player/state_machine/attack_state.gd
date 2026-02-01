class_name AttackState
extends State


var jump_speed = -900


func enter():
	print("entering ATTACK state...")
	
	#owner.get_node("AnimationPlayer").play("attack_default")
	
	if(!owner.did_attack):
		owner.current_attack.start_attack(owner)
		await owner.current_attack.attack_finished
		
	owner.did_attack = true
	
	if(owner.velocity.y > 0):
		state_machine.change_state("fallstate")
	elif(Input.get_axis(input.move_left,input.move_right) != 0):
		state_machine.change_state("walkstate")
	else:
		state_machine.change_state("idlestate")
		
func _physics_process(delta: float) -> void:
	owner.move_and_slide()
