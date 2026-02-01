extends Control

signal back_pressed
signal full_credits_requested

func _ready():
	pass

func _on_back_pressed() -> void:
	back_pressed.emit()

func _on_full_credits_pressed() -> void:
	full_credits_requested.emit()
