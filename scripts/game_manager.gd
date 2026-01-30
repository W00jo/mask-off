extends Node2D

@export var maps: Array[PackedScene]

var _current_map: BaseMap
var players: Array[Node2D]

func _ready() -> void:
	randomize()
	_spawn_map()

func _spawn_map():
	var index = randi() % maps.size()
	_current_map = maps[index].instantiate()
	add_child(_current_map)
	_current_map.start()

func _process(delta: float) -> void:
	if(players.size() > 0):
		pass

func add_player():
	var spawn_point = _current_map.get_free_spawn_point()
	
	if(spawn_point == null):
		pass
