extends Resource

class_name MaskData

@export var _attack: PackedScene
@export var animation_name: String

func get_attack() -> BaseAttack:
	return _attack.instantiate()
