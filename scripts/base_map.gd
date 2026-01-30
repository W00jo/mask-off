extends Node2D

class_name BaseMap

var _used_spawn_points := 0

@export var spawn_points: Array[Node2D]

@onready var mask_spawner: MaskSpawner = $MaskSpawner

func _ready() -> void:
	pass

func start():
	mask_spawner.initialize()

func _process(delta: float) -> void:
	pass
	
func get_free_spawn_point() -> Node2D:
	if(_used_spawn_points <= spawn_points.size()):
		return null
		
	var node = spawn_points[_used_spawn_points]
	_used_spawn_points += 1
	return node
