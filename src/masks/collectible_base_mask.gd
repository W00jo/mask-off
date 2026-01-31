class_name CollectibleBaseMask
extends Area2D

signal mask_picked_up(rand_mask)

@onready var sprite: Sprite2D = $Sprite2D
var duration := 10
var random_mask
var types = {"bomberman": preload("res://assets/sprites/maskaaaa.png"),
			"costam": preload("res://assets/sprites/maskaaaa.png")}

func _ready() -> void:
	random_mask = types.keys().pick_random()
	sprite.texture = types.get(random_mask)

func pick_up():
	mask_picked_up.emit(random_mask)
	queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		pick_up()
