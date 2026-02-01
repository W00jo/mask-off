class_name BaseAttack
extends Node

var camera_2d

func _ready():
	#print(get_parent().get_parent().get_parent().get_node("BaseMap/Camera2D"))
	pass
 
signal attack_finished


func get_attack_owner() -> Node2D:
	return owner

func start_attack(_player: Player):
	if get_parent().get_parent().get_parent().get_parent().get_node("BaseMap/Camera2D"):
		var camera_2d = get_parent().get_parent().get_parent().get_parent().get_node("BaseMap/Camera2D")
		print("wywoluje sstart atack")
		for a in 3:
			camera_2d.position += Vector2(14, 7)
			await get_tree().create_timer(0.05).timeout
			camera_2d.position -= Vector2(14, 7)
			await get_tree().create_timer(0.05).timeout
			print("szejki szejki")

func copy(_attack):
	pass
