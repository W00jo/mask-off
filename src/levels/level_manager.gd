extends Node2D

@export var maps: Array[PackedScene]
var _current_map: BaseMap
var active_players: Array[Node2D] = []
@onready var waiting_room_scene = preload("res://src/levels/waiting_room.tscn")


func spawn_waiting_room():
	var waiting_room_instance = waiting_room_scene.instantiate()
	add_child(waiting_room_instance)
	waiting_room_instance.connect("on_game_start", start_new_game)
	
func remove_level():
	for i in active_players.size():
		active_players[i].queue_free()
	_current_map.queue_free()
	active_players.clear()

func start_new_game(players):
	randomize()
	_spawn_map_and_players(players)

func _spawn_map_and_players(players):
	var index = randi() % maps.size()
	_current_map = maps[index].instantiate()
	add_child(_current_map)
	_current_map.start()
	_current_map.z_index = -1
	
	var pl_spawner_parent = _current_map.get_node("PlayerSpawners")
	print("pl spawn parent : ", pl_spawner_parent)
	for i in players.size():
		players[i].position = pl_spawner_parent.get_child(i).position
		players[i].on_player_death.connect(on_player_death)
		active_players.append(players[i])


func on_player_death(player: Player) -> void:
	active_players.erase(player)
	print(active_players.size())
	if(active_players.size() > 1):
		return
		
	await get_tree().create_timer(1).timeout
	
	var win_screen: WinScreen = UI.Instance.win_screen
	UI.Instance.hide_layer(UI.Instance.hud)
	UI.Instance.show_layer(win_screen)
	win_screen.set_winner(active_players[0])
	win_screen.on_new_game_pressed.connect(new_game)
	win_screen.on_back_to_menu_pressed.connect(to_main_menu)

func add_player():
	var spawn_point = _current_map.get_free_spawn_point()
	
	if(spawn_point == null):
		pass
		
func new_game():
	UI.Instance.hud.reset()
	UI.Instance.hide_layer(UI.Instance.win_screen)
	UI.Instance.show_layer(UI.Instance.hud)
	remove_level()
	spawn_waiting_room()
	
func to_main_menu():
	remove_level()
	UI.Instance.hide_layer(UI.Instance.win_screen)
	UI.Instance.show_layer(UI.Instance.main_menu)
	UI.Instance.hud.reset()
