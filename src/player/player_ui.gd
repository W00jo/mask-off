extends Node

@onready var health_bar: ProgressBar = $HealthBar
@onready var damage_target:DamageTarget = $"../DamageTarget"

func _ready():
	health_bar.max_value = damage_target.max_health
	

func _on_damage_target_on_damage_received(_amount: int) -> void:
	health_bar.value = damage_target.current_health


func _on_death() -> void:
	health_bar.visible = false
