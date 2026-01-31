extends CharacterBody2D

class_name Player

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var attack_parent: Node2D = $AttackParent 
@onready var attack_holder: Node2D = $AttackParent/AttackHolder 

@export var default_attack: PackedScene;

var current_attack: BaseAttack

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta 
		
func _ready():
	$StateMachine.set_input_data(InputData.new(
		"ui_left", "ui_right", "ui_accept", "attack"
	))
	$MaskSystem.on_attack_picked_up.connect(set_attack)
	set_attack(default_attack.instantiate())

func set_attack(attack: BaseAttack):
	current_attack = attack;
	attack_holder.add_child(current_attack)
	
func clear_attack():
	current_attack.queue_free()
	set_attack(default_attack.instantiate())
