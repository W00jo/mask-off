extends Node2D

@export var mask_spawner: MaskSpawner
@export var mask_spawn_points: Node
var spawn_points = []

func _ready() -> void:
	mask_spawner.connect("mask_picked_up", _on_mask_picked_up)
	print("mask spawn points; ", mask_spawn_points)
	#for spawn in mask_spawn_points.get_children():
		#print("spawn", spawn)
		#spawn_points.append(spawn)
	#var random_spawn_point = spawn_points.pick_random()
	

func _on_mask_picked_up(mask_type):
	print("MASK TYPE: ", mask_type)
