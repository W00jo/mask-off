extends CharacterBody2D

class_name Player

signal on_player_death(Player)

@export var move_left: String
@export var move_right: String
@export var jump: String
@export var attack: String
@export var default_attack: PackedScene
@export var new_attack: PackedScene
@export var state_machine: StateMachine
var current_attack: BaseAttack
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var attack_parent: Node2D = $AttackParent 
@onready var attack_holder: Node2D = $AttackParent/AttackHolder
@onready var damage_target: DamageTarget = $DamageTarget 
@onready var mask_skin: MaskSkin = $MaskSkin
@onready var mask_collector: MaskCollector = $MaskCollector

var player_color: Color = Color.WHITE

func _ready():
	print("StateMAchine: ", state_machine)
	state_machine.set_input_data(InputData.new(
		move_left, move_right, jump, attack
	))
	mask_collector.on_mask_picked_up.connect(on_mask_picked_up)
	set_attack(default_attack.instantiate())

var did_attack = false

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta 

		
func get_direction() -> int:
	return -1 if $Sprite2D.flip_h else 1
	
func reset():
	damage_target.reset()
	$UI._ready()
	set_attack(default_attack.instantiate())
	state_machine.change_state("fallstate")
	$Sprite2D.frame = 25
	$Sprite2D.visible = true
	
func on_mask_picked_up(data: MaskData):
	create_wearable_mask(data.animation_name)
	set_attack(data.get_attack())
	

func set_attack(_attack: BaseAttack):
	_attack.copy(default_attack)
	current_attack = _attack;
	print("current_attack", current_attack)
	attack_holder.add_child(current_attack)
	
func clear_attack():
	current_attack.queue_free()
	set_attack(default_attack.instantiate())

func on_death() -> void:
	on_player_death.emit(self)

func _begin_death() -> void:
	state_machine.change_state("deathstate")
	
func set_input_data(input_data: InputData):
	state_machine.set_input_data(input_data)

func create_wearable_mask(anim_name: String):
	print("MASK COLLECTED!!!! : ", anim_name)
	
	mask_skin.visible = true
	mask_skin.play_anim(anim_name)
	
func clear_mask():
	mask_skin.visible = false


func _on_knockback(data: KnockbackData) -> void:
	var from = data.from
	from *= data.force 
	velocity -= from
	
func set_color(color: Color):
	player_color = color
	$Sprite2D.modulate = color
