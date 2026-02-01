extends Control

signal back_pressed

@onready var flag_pl = $MarginContainer/VBoxContainer/OptionComponents/Language/FlagButtons/HBoxContainer/FlagPL
@onready var flag_en = $MarginContainer/VBoxContainer/OptionComponents/Language/FlagButtons/HBoxContainer/FlagEN

func _ready() -> void:
	_update_language_selection(GameManager.get_current_language())
	GameManager.language_changed.connect(_update_language_selection)

func _on_back_pressed() -> void:
	back_pressed.emit()

func _on_music_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(1, linear_to_db(value)) # id 1 is the music bus

func _on_sfx_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(2, linear_to_db(value)) # id 2 is the SFX bus

func _on_language_selected() -> void:
	var button_pressed = get_viewport().gui_get_focus_owner()
	
	if button_pressed == flag_pl:
		GameManager.change_language("pl")
	elif button_pressed == flag_en:
		GameManager.change_language("en")

func _update_language_selection(locale: String) -> void:
	# Zadymia flagi
	flag_pl.modulate = Color(1, 1, 1, 0.5)
	flag_en.modulate = Color(1, 1, 1, 0.5)
	
	# Oddymia flagi
	match locale:
		"pl":
			flag_pl.modulate = Color(1, 1, 1, 1)
		"en":
			flag_en.modulate = Color(1, 1, 1, 1)
