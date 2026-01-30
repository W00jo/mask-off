extends Node2D


var max_ticks := 2
var _current_ticks := 2
var spawned_mask: BaseMask
@export var masks: Array[PackedScene]

@onready var timer: Timer = $Timer
@onready var label: Label = $MaskSpawnPoint/Label
@onready var anim: AnimationPlayer = $MaskSpawnPoint/Label/AnimationPlayer
@onready var spawn_point = $MaskSpawnPoint
@onready var particles_1 = $"MaskSpawnPoint/Particles!!!"
@onready var particles_2 = $"MaskSpawnPoint/Particles!!!/MORE PARTICLES"


func initialize() -> void:
	randomize()
	_start_timeout()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	initialize()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _start_timeout():
	_current_ticks = max_ticks
	timer.timeout.connect(_on_timeout)
	_update_label()
	
func _on_timeout():
	_update_label()
	
	_current_ticks-=1;
	label.visible = true
	anim.play("countdown_label_shrink")
	
	if(_current_ticks < 0):
		_spawn_mask()
		label.visible = false
		timer.stop()
		
func _update_label():
	label.text = str(_current_ticks)
	
func _spawn_mask():
	var index := randi() % masks.size()
	spawned_mask = masks[index].instantiate()
	spawn_point.add_child(spawned_mask)
	
	particles_1.emitting = true
	particles_2.emitting = true
	
	await spawned_mask.mask_picked_up
	
	_start_timeout()
