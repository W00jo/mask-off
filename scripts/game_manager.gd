extends Node2D

@export var maps: Array[PackedScene]

var _current_map: BaseMap

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()
	_spawn_map()

func _spawn_map():
	var index = randi() % maps.size()
	_current_map = maps[index].instantiate()
	add_child(_current_map)
	_current_map.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func add_player():
	pass
