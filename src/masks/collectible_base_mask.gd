class_name CollectibleBaseMask
extends Area2D

signal mask_picked_up(rand_mask)

@onready var sprite: Sprite2D = $Sprite2D
var types = {"bomberman": preload("res://assets/sprites/maskaaaa.png"),
			"costam": preload("res://assets/sprites/maskaaaa.png")}
var duration := 10
var random_mask

func _ready() -> void:
	random_mask = types.keys().pick_random()
	$Sprite2D.texture = types.get(random_mask)

func pick_up():
	mask_picked_up.emit(random_mask)
	queue_free()


func _process(delta: float) -> void:
	pass
func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		pick_up()
