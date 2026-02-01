class_name BaseAttack
extends Node

signal attack_finished


func get_attack_owner() -> Node2D:
	return owner

func start_attack(_player: Player):
	pass

func copy(_attack):
	pass
