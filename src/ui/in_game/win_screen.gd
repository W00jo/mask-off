extends Control

class_name WinScreen

signal on_new_game_pressed
signal on_back_to_menu_pressed

func set_winner(player: Player):
	$WinMessageContainer/WinnerPic.modulate = player.player_color
	# Use pastel primary colors for sticky note: pastel pink, pastel yellow, pastel blue, pastel green
	var pastel_colors = [Color(1.0, 0.8, 0.85), Color(1.0, 1.0, 0.7), Color(0.7, 0.85, 1.0), Color(0.8, 1.0, 0.8)]
	var random_color = pastel_colors[randi() % pastel_colors.size()]
	$StickyNote.modulate = random_color

func _on_new_game_pressed() -> void:
	on_new_game_pressed.emit()

func _on_back_to_menu_pressed() -> void:
	on_back_to_menu_pressed.emit()
