extends Node

class_name DamageTarget

signal on_death
signal on_damage_received(amount: int)

@export var max_health: int
var current_health: int

func _ready():
	current_health = max_health
	
func receive_damage(damage_data: DamageData):
	if(damage_data == null):
		return
	
	var fixed_amount = min(current_health, damage_data.damage_value)
	current_health -= fixed_amount
	
	on_damage_received.emit(fixed_amount)
	
	if(current_health == 0):
		death()
	
func death():
	on_death.emit()
