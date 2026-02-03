class_name BaseMap
extends Node2D

@export var spawn_points: Array[Node2D]
@export var level_music: AudioStream
var _used_spawn_points := 0
var music_player: AudioStreamPlayer
@onready var mask_spawner: MaskSpawner = $MaskSpawner
@onready var timer: Timer = $Timer if has_node("Timer") else null
const TRAIN = preload("res://src/levels/03_platform_level/train.tscn")


func start():
	mask_spawner.initialize()
	_start_level_music()

func _start_level_music() -> void:
	if level_music == null:
		return
	music_player = AudioStreamPlayer.new()
	music_player.stream = level_music
	music_player.finished.connect(music_player.play)
	add_child(music_player)
	music_player.play()
	
	

func get_free_spawn_point() -> Node2D:
	if(_used_spawn_points <= spawn_points.size()):
		return null
	
	var node = spawn_points[_used_spawn_points]
	_used_spawn_points += 1
	return node

func _on_timer_timeout() -> void:
	var pendolino = TRAIN.instantiate()
	add_child(pendolino)
