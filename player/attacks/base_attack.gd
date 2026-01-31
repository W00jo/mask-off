extends Node

class_name BaseAttack

signal attack_finished

func get_attack_owner() -> Node2D:
	return owner

func start_attack(player: Player):
	pass

func copy(attack):
	pass
