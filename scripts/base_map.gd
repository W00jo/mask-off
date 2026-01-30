extends Node2D

class_name BaseMap

var _used_spawn_points := 0

@export var spawn_points: Array[Node2D]

@onready var mask_spawner: MaskSpawner = $MaskSpawner

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func start():
	mask_spawner.initialize()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func get_free_spawn_point() -> Node2D:
	if(_used_spawn_points <= spawn_points.size()):
		return null
		
	var node = spawn_points[_used_spawn_points]
	_used_spawn_points += 1
	return node
