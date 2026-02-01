class_name CollectibleBaseMask
extends Area2D

signal mask_picked_up(rand_mask)

var duration := 10
var random_mask
@onready var anim: AnimationPlayer = $AnimationPlayer



func _ready() -> void:
	random_mask = GameManager.mask_types.keys().pick_random()
	anim.play(GameManager.mask_types.get(random_mask))

func pick_up():
	mask_picked_up.emit(random_mask)
	queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		pick_up()
		body.create_wearable_mask(random_mask)
