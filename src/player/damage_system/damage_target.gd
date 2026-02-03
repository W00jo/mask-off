class_name DamageTarget
extends Node

signal on_death
signal on_damage_received(amount: int)
signal on_knockback(data: KnockbackData)
signal on_reset

@export var max_health: int
var current_health: int

func _ready():
	current_health = max_health
	
func reset():
	current_health = max_health
	on_reset.emit()
	
func receive_damage(damage_data: DamageData):
	if(damage_data == null):
		return
	
	#var fixed_amount = min(current_health, damage_data.damage_value)
	current_health -= damage_data.damage_value
	
	on_damage_received.emit(damage_data.damage_value)
	on_knockback.emit(damage_data.knockback_data)
	
	if(current_health <= 0):
		death()
	
func death():
	on_death.emit()
