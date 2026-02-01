extends Node2D

@onready var train: Sprite2D = $Train_sprite
@onready var warning: Sprite2D = $Warning_sprite


func _ready() -> void:
	warning.visible = false
	set_process(false)
	for a in 5:
		warning.visible = true
		await get_tree().create_timer(0.1).timeout
		warning.visible = false
		await get_tree().create_timer(0.1).timeout
		
		if a == 4:
			set_process(true)

func _process(delta: float) -> void:
	train.position.x -= 3000 * delta
	if train.position.x <= -5000:
		queue_free()
