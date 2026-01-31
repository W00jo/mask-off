extends Node

class_name DamageSource

@export var damage_value: int

func _on_body_entered(body):
	var damage_target = body.get_node("DamageTarget")
	if(damage_target == null):
		pass
		
	if(damage_target.owner == owner.get_parent().owner):
		return
		
	if(damage_target.has_method("receive_damage")):
		print(damage_value)
		damage_target.receive_damage(DamageData.new(damage_value))
