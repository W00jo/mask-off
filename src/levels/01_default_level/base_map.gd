class_name BaseMap
extends Node2D

@export var spawn_points: Array[Node2D]
var _used_spawn_points := 0
@onready var mask_spawner: MaskSpawner = $MaskSpawner


func start():
	mask_spawner.initialize()

func get_free_spawn_point() -> Node2D:
	if(_used_spawn_points <= spawn_points.size()):
		return null
	
	var node = spawn_points[_used_spawn_points]
	_used_spawn_points += 1
	return node
