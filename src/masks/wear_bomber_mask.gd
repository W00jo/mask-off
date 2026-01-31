extends WearBaseMask

@export var bomb_scene: PackedScene
@onready var spawn_point = $BombMarker
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var new_bomb = bomb_scene.instantiate()
	if Input.is_action_just_pressed("press_x"):
		print("Spawnuje bombe")
		add_child(new_bomb)
		new_bomb.global_transform = spawn_point.global_transform
