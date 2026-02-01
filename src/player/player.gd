extends CharacterBody2D

class_name Player

signal on_player_death(Player)

@export var move_left: String
@export var move_right: String
@export var jump: String
@export var attack: String
@export var default_attack: PackedScene
@export var new_attack: PackedScene
@export var mask_parent: Node2D
@export var state_machine: StateMachine
var current_attack: BaseAttack
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var attack_parent: Node2D = $AttackParent 
@onready var attack_holder: Node2D = $AttackParent/AttackHolder
@onready var damage_target: DamageTarget = $DamageTarget 
@onready var mask_system: Area2D = $MaskSystem
@onready var wearable_mask_scene = preload("res://src/masks/werable_base_mask.tscn")

var player_color: Color = Color.WHITE

func _ready():
	print("StateMAchine: ", state_machine)
	state_machine.set_input_data(InputData.new(
		move_left, move_right, jump, attack
	))
	mask_system.on_attack_picked_up.connect(set_attack)
	set_attack(default_attack)

var did_attack = false

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta 

		
func get_direction() -> int:
	return -1 if $Sprite2D.flip_h else 1
	
func reset():
	damage_target.reset()
	$UI._ready()
	set_attack(default_attack)
	state_machine.change_state("fallstate")
	$Sprite2D.frame = 25

func set_attack(_attack: PackedScene):
	var _new_attack: BaseAttack = _attack.instantiate()
	_new_attack.copy(default_attack)
	current_attack = _new_attack;
	attack_holder.add_child(current_attack)
	
func clear_attack():
	current_attack.queue_free()
	set_attack(default_attack)

func on_death() -> void:
	on_player_death.emit(self)

func _begin_death() -> void:
	state_machine.change_state("deathstate")
	
func set_input_data(input_data: InputData):
	state_machine.set_input_data(input_data)

func create_wearable_mask(mask):
	print("MASK COLLECTED!!!! : ", mask)
	var wearable_mask_instance = wearable_mask_scene.instantiate()
	mask_parent.add_child(wearable_mask_instance)
	wearable_mask_instance.set_type(mask)


func _on_knockback(data: KnockbackData) -> void:
	var from = data.from
	from *= data.force 
	velocity -= from
	
func set_color(color: Color):
	player_color = color
	$Sprite2D.modulate = color
