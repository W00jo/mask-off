class_name WearBomberMask
extends WearBaseMask

@export var bomb_scene: PackedScene
@onready var spawn_point = $BombMarker

func _process(_delta: float) -> void:
	var new_bomb = bomb_scene.instantiate()
	if Input.is_action_just_pressed("press_x"):
		print("Spawnuje bombe")
		add_child(new_bomb)
		new_bomb.global_transform = spawn_point.global_transform
