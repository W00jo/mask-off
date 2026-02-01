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
	player.damage_target.on_reset.connect(on_reset)
	player.damage_target.on_death.connect(on_player_death)
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
	
func on_reset():
	set_current_health()
	$VBoxContainer/HBoxContainer/PlayerIcon.texture = load("res://assets/sprites/ziomek_profilowe.png")
	$VBoxContainer/HBoxContainer/PlayerLabel.text = label_name
	
func on_player_death():	
	$VBoxContainer/HBoxContainer/PlayerIcon.texture = load("res://assets/sprites/ziomek_nie_zyje.png")
	$VBoxContainer/HBoxContainer/PlayerLabel.text = label_name + "\n" + "DEAD"
	
func set_max_health(max_health: int):
	health_bar.max_value = max_health
	health_bar.value = max_health

func reset():
	$VBoxContainer/HBoxContainer/PlayerIcon.texture = load("res://assets/sprites/znak_zapytania.png")
	$VBoxContainer/HBoxContainer/PlayerIcon.modulate = Color.WHITE
	$VBoxContainer/HealthBar.max_value = 0
