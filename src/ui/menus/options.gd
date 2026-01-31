extends Control

signal back_pressed


func _on_back_pressed() -> void:
	back_pressed.emit()

func _on_music_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(1, linear_to_db(value)) # id 1 is the music bus

func _on_sfx_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(2, linear_to_db(value)) # id 2 is the SFX bus

# TODO: Add Language selection
