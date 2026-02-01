extends StaticBody2D

var starting_position : Vector2 


func _ready() -> void:
	starting_position = position
	set_process(false)

func _process(delta: float) -> void:
	position.y += 500 * delta 
	if position.y >= 5000:
		position.y = starting_position.y
		set_process(false)

func _on_area_for_player_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		await get_tree().create_timer(1,5).timeout
		set_process(true)
