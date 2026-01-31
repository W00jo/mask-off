extends StaticBody2D
var starting_position : Vector2 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	starting_position = position
	set_process(false)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y += 500 * delta 
	if position.y >= 1000:
		position.y = starting_position.y
		set_process(false)
		
		

func _on_area_for_player_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		await get_tree().create_timer(randf_range(1,3)).timeout
		set_process(true)
