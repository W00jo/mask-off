extends Area2D

@export var DMG_amount : int

func _on_body_entered(body: Node2D) -> void:
	if body.name == "player":
		print(body," odpadł")
		body.queue_free()
		#################
		#body.current_health -= DMG_amount
