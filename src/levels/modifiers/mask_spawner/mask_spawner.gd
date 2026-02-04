class_name MaskSpawner
extends Node2D

@export var spawn_parent: Node
@export var max_ticks := 2
@export var show_treshold := 5
var _current_ticks := 2
var spawn_points: Array[Node] = []
var next_spawn: Vector2
@export var masks: Array[MaskData]
@export var mask_prefab = preload("res://src/masks/collectible_mask.tscn")
@onready var timer: Timer = $Timer
@onready var label_parent: Node2D = $LabelParent
@onready var label: Label = $LabelParent/Label
@onready var anim: AnimationPlayer = $LabelParent/Label/AnimationPlayer
@onready var particles_1 = $"Particles!!!"
@onready var particles_2 = $"Particles!!!/MORE PARTICLES"
@onready var spawn_particles = $SpawnParticles


func initialize() -> void:
	randomize()
	for spawn in spawn_parent.get_children():
		spawn_points.append(spawn)
		
	_start_timeout()

func _start_timeout():
	next_spawn = spawn_points.pick_random().global_position
	print("Next spawn: ", next_spawn)
	label_parent.global_position = next_spawn
	spawn_particles.global_position = next_spawn
	label.visible = false
	_current_ticks = max_ticks
	_update_label()
	$"Timer".start()

func _on_timeout():
	print("Tick: ", _current_ticks)
	
	if _current_ticks == show_treshold:
		on_show_spawn_point()
	
	if(_current_ticks <= show_treshold):
		_update_label()
		anim.play("countdown_label_shrink")
		
	_current_ticks-=1;
	
	if(_current_ticks < 0):
		_spawn_mask()
		timer.stop()
		on_hide_spawn_point()

func _update_label():
	label.text = str(_current_ticks)

func _spawn_mask():
	var mask_data = masks.pick_random()
	var mask: CollectibleMask = mask_prefab.instantiate()
	add_child(mask)
	mask.set_mask(mask_data)
	
	mask.global_position = next_spawn
	print("label: ",label_parent.global_position, " mask: ", mask.global_position)
	particles_1.global_position = next_spawn
	particles_2.global_position = next_spawn
	
	particles_1.emitting = true
	particles_2.emitting = true
	
	await mask.mask_picked_up
	
	_start_timeout()
	
func on_show_spawn_point():
	label.visible = true
	spawn_particles.emitting = true
	
func on_hide_spawn_point():
	label.visible = false
	spawn_particles.emitting = false
