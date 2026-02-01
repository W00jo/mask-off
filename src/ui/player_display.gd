@tool
extends Control

class_name PlayerDisplay

@export var label_name: String = "" : set = set_label_name
@onready var health_bar: ProgressBar = $VBoxContainer/HealthBar

var player: Player

func bind_player(player: Player):
	self.player = player
	player.damage_target.on_damage_received.connect(
		func(val): set_current_health()
	)
	player.damage_target.on_reset.connect(set_current_health)
	set_max_health(player.damage_target.max_health)

func set_label_name(value: String):
	label_name = value
	var label = $VBoxContainer/HBoxContainer/PlayerLabel
	label.text = value
	
func set_profile_color(color: Color):
	$VBoxContainer/HBoxContainer/PlayerIcon.modulate = color
	
func show_profile():
	$VBoxContainer/HBoxContainer/PlayerIcon.texture = load("res://assets/sprites/ziomek_profilowe.png")

func set_current_health():
	health_bar.value = player.damage_target.current_health
	
func set_max_health(max_health: int):
	health_bar.max_value = max_health
	health_bar.value = max_health

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass 
