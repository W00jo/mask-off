extends Node

signal paused
signal language_changed(locale: String)

const SAVE_PATH = "user://settings.cfg"

var mask_types = {"godot": "mask_godot",
				"isaac": "mask_isaac",
				"konduktor": "mask_konduktor",
				"plague_doc": "mask_plague",
				"bomberman": "mask_bomberman",
				"blender": "mask_blender",
				"catboy": "mask_catboy",
				"pig": "mask_pig"}


func _ready() -> void:
	_load_settings()

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		paused.emit()

func change_language(locale: String) -> void:
	TranslationServer.set_locale(locale)
	language_changed.emit(locale)
	_save_settings()
	print(locale)

func get_current_language() -> String:
	return TranslationServer.get_locale()

func _save_settings() -> void:
	var config = ConfigFile.new()
	config.set_value("settings", "language", TranslationServer.get_locale())
	config.save(SAVE_PATH)

func _load_settings() -> void:
	var config = ConfigFile.new()
	var err = config.load(SAVE_PATH)
	if err == OK:
		var locale = config.get_value("settings", "language", "en")
		TranslationServer.set_locale(locale)
