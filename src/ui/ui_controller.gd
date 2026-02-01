class_name UI
extends Node

@export var hud: Hud
@export var main_menu: Control
@export var options: Control
@export var credits: Control
@export var how_to_play: Control
@export var pause: Control
@export var win_screen: Control
@export var level_manager: Node2D

static var Instance: UI = null

func _init():
	if(Instance == null):
		Instance = self
	else:
		queue_free()

func _ready() -> void:
	connect_signals()
	print("Instance",Instance)
	
	# Hide all UI layers
	for child in get_children():
		if child is CanvasLayer:
			child.hide()
	
	# Show main menu layer
	show_layer(main_menu)

func connect_signals():
	main_menu.connect("play_pressed", _on_menu_play_pressed)
	main_menu.connect("options_pressed", _on_menu_options_pressed)
	main_menu.connect("credits_pressed", _on_menu_credits_pressed)
	main_menu.connect("exit_pressed", _on_menu_exit_pressed)
	
	options.connect("back_pressed", _on_options_back_pressed)
	credits.connect("back_pressed", _on_credits_pressed)
	
	#how_to_play.connect("start_pressed", _on_howto_start_pressed)
	
	GameManager.connect("paused", _on_paused)
	
	pause.connect("resume_pressed", _on_resume_pressed)
	
	win_screen.connect("on_new_game_pressed", _on_win_new_game_pressed)
	win_screen.connect("on_back_to_menu_pressed", _on_win_back_to_menu_pressed)

func show_layer(component:Control):
	if component.get_parent() is CanvasLayer:
		component.get_parent().show()
	else:
		push_error("Cannot show layer - UI component's parent is not a CanvasLayer. Check the tree!")

func hide_layer(component:Control):
	if component.get_parent() is CanvasLayer:
		component.get_parent().hide()
	else:
		push_error("Cannot hide layer - UI component's parent is not a CanvasLayer. Check the tree!")

func _on_menu_play_pressed():
	hide_layer(main_menu)
	show_layer(hud)
	level_manager.spawn_waiting_room()

func _on_menu_options_pressed():
	hide_layer(main_menu)
	show_layer(options)

func _on_menu_credits_pressed():
	hide_layer(main_menu)
	show_layer(credits)

func _on_menu_exit_pressed():
	get_tree().quit()

func _on_options_back_pressed():
	hide_layer(options)
	show_layer(main_menu)

func _on_credits_pressed():
	hide_layer(credits)
	show_layer(main_menu)

#func _on_howto_start_pressed():
	#hide_layer(how_to_play)
	## TODO: Start the game

func _on_paused():
	# Checking if not in menu or sub-menus. Change later to check if game started.
	if main_menu.get_parent().visible or options.get_parent().visible or credits.get_parent().visible:
		return
	else:
		show_layer(pause)
		get_tree().paused = true

func _on_resume_pressed():
	hide_layer(pause)
	get_tree().paused = false

func _on_win_new_game_pressed():
	hide_layer(win_screen)
	# TODO: Start new game

func _on_win_back_to_menu_pressed():
	hide_layer(win_screen)
	show_layer(main_menu)
