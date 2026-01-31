extends Node

class_name DamageSource

@export var damage_data: DamageData

func _on_body_entered(body):
	print(body.name + " - " + owner.name)
	
	var damage_target = body.get_node("DamageTarget")
	if(damage_target == null):
		pass
		
	#if(damage_target.has_method("receive_damage")):
	#	damage_target.receive_damage(damage_data)
