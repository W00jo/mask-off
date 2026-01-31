extends Node2D

signal on_game_start(players: Array[Player])

var _activated_players: Array[bool] = [false, false, false, false]
var _players: Array[Player] = []
var input_actions = [
	["p1_move_left", "p1_move_right", "p1_jump", "p1_attack"],
	["p2_move_left", "p2_move_right", "p2_jump", "p2_attack"],
	["p3_move_left", "p3_move_right", "p3_jump", "p3_attack"],
	["p4_move_left", "p4_move_right", "p4_jump", "p4_attack"]
]

var input_actions_names = [
	["Left", "Right", "Up", "Down"],
	["A", "D", "W", "S"],
	["Num4", "Num6", "Num8", "Num5"],
	["J", "L", "I", "K"],
]

@export var packedPlayer: PackedScene


func _ready() -> void:
	await get_tree().create_timer(0.1).timeout
	var displays = UI.Instance.hud.player_displays
	for i in range(displays.size()):
		var d: PlayerDisplay = displays[i]
		var l = "[" + input_actions_names[i][0] + "]"
		var r = "[" + input_actions_names[i][1] + "]"
		d.set_label_name(l + " + " + r)
	
func _input(_event: InputEvent) -> void:
	for i in range(4):
		if(_player_activated(i)):
			_activate_player(i)
	if(Input.is_action_just_pressed("start_game") and _players.size() >= 2):
		start_game()
	
func _player_activated(index: int) -> bool:
	if Input.is_action_pressed(input_actions[index][0]):
		if Input.is_action_pressed(input_actions[index][1]):
			return true
	return false
	
func _activate_player(index: int):
	if(_activated_players[index]):
		return
		
	_activated_players[index] = true
		
	UI.Instance.hud.player_displays[index].set_label_name("Player " + str(index + 1))
	
	var player: Player = packedPlayer.instantiate()
	var input = input_actions[index]
	player.set_input_data(InputData.new(input[0], input[1], input[2], input[3]))
	add_sibling(player)
	player.position = Vector2(600, 300)
	player.damage_target.on_death.connect(
	Callable(self, "ressurect_player").bind(player)
	)
	
	UI.Instance.hud.player_displays[index].set_max_health(player.damage_target.max_health)
	player.damage_target.on_damage_received.connect(UI.Instance.hud.player_displays[index].set_current_health)
	
	_players.append(player)
	
	if(_players.size() == 2):
		UI.Instance.hud.show_play_game_popup()
		
func start_game():
	on_game_start.emit(_players)
	queue_free()
	
func ressurect_player(player: Player):
	player.position = Vector2(600, 300)
	player.reset()
