class_name DeathState
extends State

var jump_speed = -900


func enter():
	print("entering death state...")
	
	owner.animation_player.play("player_death")
	await owner.animation_player.animation_finished
	print("death anim finished")
	owner.on_death()
