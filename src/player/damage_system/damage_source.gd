extends Node2D

class_name DamageSource

@export var damage_value: int
@export var knockback_strength = Vector2.ZERO

var has_custom_parent
var parent: Node2D

func _on_body_entered(body):
	var damage_target = body.get_node("DamageTarget")
	if(damage_target == null):
		pass
		
	if(damage_target.owner == owner.get_parent().owner):
		return
		
	var origin = parent.position if has_custom_parent else position
	var from = origin - body.position
	if(damage_target.has_method("receive_damage")):
		damage_target.receive_damage(DamageData.new(damage_value, from, knockback_strength))
		
func set_custom_parent(parent: Node2D):
	has_custom_parent = true
	self.parent = parent
