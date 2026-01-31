extends CharacterBody2D

class_name Player

signal on_player_death

@export var move_left: String
@export var move_right: String
@export var jump: String
@export var attack: String

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var attack_parent: Node2D = $AttackParent 
@onready var attack_holder: Node2D = $AttackParent/AttackHolder
@onready var damage_target: DamageTarget = $DamageTarget 

@export var default_attack: PackedScene
@export var new_attack: PackedScene

var current_attack: BaseAttack

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta 
		
func get_direction() -> int:
	return -1 if $Sprite2D.flip_h else 1
		
func _ready():
	$StateMachine.set_input_data(InputData.new(
		move_left, move_right, jump, attack
	))
	$MaskSystem.on_attack_picked_up.connect(set_attack)
	set_attack(default_attack)
	
func reset():
	damage_target._ready()
	set_attack(default_attack)
	$StateMachine.change_state("fallstate")

func set_attack(attack: PackedScene):
	var new_attack: BaseAttack = attack.instantiate()
	new_attack.copy(default_attack)
	current_attack = new_attack;
	attack_holder.add_child(current_attack)
	
func clear_attack():
	current_attack.queue_free()
	set_attack(default_attack)

func on_death() -> void:
	on_player_death.emit()
	queue_free()

func _begin_death() -> void:
	$StateMachine.change_state("deathstate")
	
func set_input_data(input_data: InputData):
	$StateMachine.set_input_data(input_data)
