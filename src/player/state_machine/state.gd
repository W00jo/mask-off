class_name State
extends Node

var state_machine: StateMachine
var input: InputData

func set_input(new_input: InputData):
	print(name, new_input.move_left, new_input.move_right, new_input.jump)
	input = new_input

func enter():
	pass

func exit():
	pass

func update(delta:float):
	pass

func physics_update(delta:float):
	pass

func handle_input(event:InputEvent):
	pass
