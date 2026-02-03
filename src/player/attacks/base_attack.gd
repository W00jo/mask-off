class_name BaseAttack
extends Node

var camera_2d

signal on_attack_end

func _ready():
	#print(get_parent().get_parent().get_parent().get_node("BaseMap/Camera2D"))
	pass

signal attack_finished


func get_attack_owner() -> Node2D:
	return owner

func start_attack(_player: Player):
	var camera = get_tree().get_first_node_in_group("camera")
	if camera:
		print("wywoluje sstart atack")
		for a in 3:
			camera.position += Vector2(14, 7)
			await get_tree().create_timer(0.05).timeout
			camera.position -= Vector2(14, 7)
			await get_tree().create_timer(0.05).timeout
			print("szejki szejki")

func copy(_attack):
	pass
