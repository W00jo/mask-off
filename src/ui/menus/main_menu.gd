extends Control

signal play_pressed
signal instruction_pressed
signal options_pressed
signal credits_pressed
signal howtoplay_pressed
signal exit_pressed

const VERSION := "0.1.0"

@onready var click_sounds := [
	preload("res://src/ui/menus/click_sfx/click_001.ogg"),
	preload("res://src/ui/menus/click_sfx/click_002.ogg"),
	preload("res://src/ui/menus/click_sfx/click_003.ogg"),
	preload("res://src/ui/menus/click_sfx/click_004.ogg"),
	preload("res://src/ui/menus/click_sfx/click_005.ogg")
]

@onready var title_label = $Title
@onready var play_button = $VBoxContainer/Play
@onready var options_button = $VBoxContainer/Options
@onready var credits_button = $VBoxContainer/Credits
@onready var howtoplay_button = $VBoxContainer/Howtoplay
@onready var exit_button = $VBoxContainer/Exit
@onready var version_label = $VersionLabel

var audio_player: AudioStreamPlayer

func _ready() -> void:
	audio_player = AudioStreamPlayer.new()
	add_child(audio_player)
	audio_player.bus = "SFX"
	
	_update_translations()
	GameManager.language_changed.connect(_on_language_changed)
	
	# Fade-in animation
	modulate.a = 0.0
	var tween = create_tween().set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_CUBIC)
	tween.tween_property(self, "modulate:a", 1.0, 0.5)

func _update_translations() -> void:
	title_label.text = tr("MAIN_MENU")
	play_button.text = tr("PLAY")
	options_button.text = tr("OPTIONS")
	credits_button.text = tr("CREDITS")
	howtoplay_button.text = tr("HOW_TO_PLAY")
	exit_button.text = tr("EXIT")
	version_label.text = "v" + VERSION

func _on_language_changed(_locale: String) -> void:
	_update_translations()

func _play_click_sound() -> void:
	if click_sounds.is_empty():
		return
	audio_player.stream = click_sounds[randi() % click_sounds.size()]
	audio_player.play()

func _on_play_pressed() -> void:
	_play_click_sound()
	play_pressed.emit()

func _on_instruction_pressed() -> void:
	_play_click_sound()
	instruction_pressed.emit()

func _on_options_pressed() -> void:
	_play_click_sound()
	options_pressed.emit()

func _on_credits_pressed() -> void:
	_play_click_sound()
	credits_pressed.emit()

func _on_exit_pressed() -> void:
	_play_click_sound()
	exit_pressed.emit()

func _on_howtoplay_pressed() -> void:
	_play_click_sound()
	howtoplay_pressed.emit()

func _on_itchio_pressed() -> void:
	_play_click_sound()
	OS.shell_open("https://itch.io/jam/your-game-page")
