extends Node

class_name DamageSource

@export var damage_data: DamageData

func _on_body_entered(body):
	if(body.has_method("receive_damage")):
		body.receive_damage(damage_data)
