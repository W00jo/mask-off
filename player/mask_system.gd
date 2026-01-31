extends Node2D

signal on_attack_picked_up(attack)

func _on_body_entered(body):
	if(body.has_method("pick_up")):
		on_attack_picked_up.emit(body.get_attack)
		body.pick_up()
