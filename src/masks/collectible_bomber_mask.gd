class_name BombermanMask
extends CollectibleBaseMask


func pick_up():
	emit_signal("mask_picked_up")
	queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		pick_up()
