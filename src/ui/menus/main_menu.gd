extends Control

signal play_pressed
signal howtoplay_pressed
signal options_pressed
signal credits_pressed
signal exit_pressed

@onready var click_sounds := [
	preload("res://src/ui/menus/click_sfx/click_01.ogg"),
	preload("res://src/ui/menus/click_sfx/click_02.ogg"),
	preload("res://src/ui/menus/click_sfx/click_03.ogg"),
	preload("res://src/ui/menus/click_sfx/click_04.ogg"),
	preload("res://src/ui/menus/click_sfx/click_05.ogg")
]

@onready var title_label = $MenuInterface/Title
@onready var play_button = $MenuInterface/MenuButtons/Play
@onready var howtoplay_button = $MenuInterface/MenuButtons/HowToPlay
@onready var options_button = $MenuInterface/MenuButtons/Options
@onready var credits_button = $MenuInterface/MenuButtons/Credits
@onready var exit_button = $MenuInterface/MenuButtons/Exit
@onready var audio_player = $ClickSFX
@onready var fart = $FartSFX

func _ready() -> void:
	
	_update_translations()
	GameManager.language_changed.connect(_on_language_changed)
	
	# Fade-in animation
	modulate.a = 0.0
	var tween = create_tween().set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_CUBIC)
	tween.tween_property(self, "modulate:a", 1.0, 0.5)

func _update_translations() -> void:
	play_button.text = tr("PLAY")
	options_button.text = tr("OPTIONS")
	credits_button.text = tr("CREDITS")
	howtoplay_button.text = tr("HOW_TO_PLAY")
	exit_button.text = tr("EXIT")

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

func _on_how_to_play_pressed() -> void:
	_play_click_sound()
	howtoplay_pressed.emit()

func _on_options_pressed() -> void:
	_play_click_sound()
	options_pressed.emit()

func _on_credits_pressed() -> void:
	_play_click_sound()
	credits_pressed.emit()

func _on_exit_pressed() -> void:
	_play_click_sound()
	exit_pressed.emit()

func _on_itchio_pressed() -> void:
	_play_click_sound()
	OS.shell_open("https://itch.io/jam/your-game-page")

func _on_butt_pressed() -> void:
	fart.play()
