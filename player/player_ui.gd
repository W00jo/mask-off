extends Node

@onready var health_bar: ProgressBar = $HealthBar
@onready var damage_target:DamageTarget = $"../DamageTarget"

func _ready():
	health_bar.max_value = damage_target.max_health
	damage_target.on_damage_received.connect(_on_dmg_received)
	
func _on_dmg_received():
	health_bar.value = damage_target.current_health
