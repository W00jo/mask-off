class_name MaskSpawner
extends Node2D

@export var spawn_parent: Node
@export var max_ticks := 2
@export var show_treshold := 5
var _current_ticks := 2
var spawn_points = []
@onready var timer: Timer = $Timer
@onready var label: Label = $MaskSpawnPoint/Label
@onready var anim: AnimationPlayer = $MaskSpawnPoint/Label/AnimationPlayer
@onready var particles_1 = $"MaskSpawnPoint/Particles!!!"
@onready var particles_2 = $"MaskSpawnPoint/Particles!!!/MORE PARTICLES"


func initialize() -> void:
	randomize()
	_start_timeout()

func _start_timeout():
	_current_ticks = max_ticks
	_update_label()

func _on_timeout():
	if(_current_ticks <= show_treshold):
		_update_label()
		label.visible = true
		anim.play("countdown_label_shrink")
		
	_current_ticks-=1;
	
	if(_current_ticks < 0):
		_spawn_mask()
		label.visible = false
		timer.stop()

func _update_label():
	label.text = str(_current_ticks)

func _spawn_mask():
	var spawned_mask = preload("res://src/masks/collectible_base_mask.tscn").instantiate()
	for spawn in spawn_parent.get_children():
		spawn_points.append(spawn)
	var random_spawn_point = spawn_points.pick_random()
	position = random_spawn_point.position
	add_child(spawned_mask)
	spawned_mask.z_index = 2
	
	particles_1.emitting = true
	particles_2.emitting = true
	
	await spawned_mask.mask_picked_up
	print("???")
	
	_start_timeout()
