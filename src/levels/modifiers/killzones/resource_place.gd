extends DamageSource

@export var DMG_amount : int

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		print("Zadaje obrazenia", DMG_amount)
		body.get_node("DamageTarget").receive_damage(DamageData.new(90))
		#################
		#body.current_health -= DMG_amount
