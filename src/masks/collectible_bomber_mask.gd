extends CollectibleMask

class_name BombermanMask

func pick_up():
	emit_signal("mask_picked_up")
	queue_free()

func _ready() -> void:
	pass 


func _process(delta: float) -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		pick_up()
