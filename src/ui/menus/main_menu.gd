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
	preload("res://src/ui/menus/click_sfx/click_05.ogg"),
	preload("res://src/ui/menus/click_sfx/boowomp.mp3")
]

@onready var play_button = $MenuInterface/MenuButtons/Play
@onready var howtoplay_button = $MenuInterface/MenuButtons/HowToPlay
@onready var options_button = $MenuInterface/MenuButtons/Options
@onready var credits_button = $MenuInterface/MenuButtons/Credits
@onready var exit_button = $MenuInterface/MenuButtons/Exit
@onready var audio_player = $ClickSFX
@onready var fart = $FartSFX
@onready var main_menu_music = $MainMenuMusic

const MENU_MUSIC = preload("res://assets/audio/soundtrack/Menu.wav")
const MUSIC_FADE_DURATION := 1.5

func _ready() -> void:
	_update_translations()
	GameManager.language_changed.connect(_on_language_changed)
	
	# Fade-in animation
	modulate.a = 0.0
	var tween = create_tween().set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_CUBIC)
	tween.tween_property(self, "modulate:a", 1.0, 0.5)
	
	# Start music with fade-in
	_play_menu_music()

func _play_menu_music() -> void:
	main_menu_music.stream = MENU_MUSIC
	main_menu_music.volume_db = -40.0
	main_menu_music.play()
	main_menu_music.finished.connect(_on_menu_music_finished)
	
	var music_tween = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_CUBIC)
	music_tween.tween_property(main_menu_music, "volume_db", 0.0, MUSIC_FADE_DURATION)

func _on_menu_music_finished() -> void:
	main_menu_music.play()

func _stop_menu_music() -> void:
	var fade_tween = create_tween().set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_CUBIC)
	fade_tween.tween_property(main_menu_music, "volume_db", -40.0, 0.5)
	fade_tween.tween_callback(main_menu_music.stop)

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
	_stop_menu_music()
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
	OS.shell_open("https://itch.io/")

func _on_butt_pressed() -> void:
	fart.play()

var combo = ["ui_up", "ui_up", "ui_down", "ui_down", "ui_left", "ui_right", "ui_left", "ui_right", "B", "A"]
var combo_index := 0
var combo_time := 5
var last_input_time := 0
var numer : int = -750

#func _input(event):
	#if not event is InputEventKey:
		#return
#
	#if combo_index >= combo.size():
		#combo_index = 0
#
	#if event.is_action_pressed(combo[combo_index]):
		#var now := Time.get_ticks_msec()
		#if combo_index == 0 or (now - last_input_time) / 1000.0 <= combo_time:
			#combo_index += 1
			#last_input_time = now
			#if combo_index == combo.size():
				#combo_index = 0
				#const GRACZ = preload("res://src/player/player.tscn")
				#var new_gracz = GRACZ.instantiate()
				#new_gracz.position = Vector2(500,numer -100)
				#add_child(new_gracz)
				#print("test")
				##icy_tower()
				#var tween = get_tree().create_tween()
				#tween.tween_property(self, "position", Vector2(0,1300), 4.0)
				#tween.tween_property(self, "position", Vector2(0,7000), 40.0).set_trans(Tween.TRANS_CIRC).set_ease(0)
		#else:
			#combo_index = 0
	#elif event.is_pressed() and event.as_text() != "":
		#combo_index = 0
#
##func icy_tower():
	##const KLAWISZ = preload("uid://befng7nqcmpkt")
	##var new_klawisz = KLAWISZ.instantiate()
	##new_klawisz.position = Vector2(randf_range(300,1000),numer)
	##var platform = KLAWISZ.instantiate()
	##platform.position = Vector2(0,0)
	##numer -= 200
	##add_child(new_klawisz)
	##if numer >= -100000:
		##icy_tower()
