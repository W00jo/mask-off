extends Node2D

var _activated_players: Array[bool] = [false, false, false, false]
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
	
func _input(event: InputEvent) -> void:
	for i in range(4):
		if(_player_activated(i)):
			_activate_player(i)
	
func _player_activated(index: int) -> bool:
	if Input.is_action_pressed(input_actions[index][0]):
		if Input.is_action_pressed(input_actions[index][1]):
			return true
	return false
	
func _activate_player(index: int):
	if(_activated_players[index]):
		return
		
	_activated_players[index] = true
	print("Player " + str(index) + " activated")
		
	UI.Instance.hud.player_displays[index].set_label_name("Player " + str(index + 1))
	
	var player: Player = packedPlayer.instantiate()
	var input = input_actions[index]
	player.set_input_data(InputData.new(input[0], input[1], input[2], input[3]))
	add_child(player)
	player.position = Vector2(600, 300)
	
