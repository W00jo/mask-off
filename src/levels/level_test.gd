extends Node2D

@export var mask_spawner: MaskSpawner
@export var mask_spawn_points: Node
var spawn_points = []

func _ready() -> void:
	mask_spawner.connect("mask_picked_up", _on_mask_picked_up)
	for spawn in mask_spawn_points:
		spawn_points.append(spawn)
		
	

func _on_mask_picked_up(mask_type):
	print("MASK TYPE: ", mask_type)
