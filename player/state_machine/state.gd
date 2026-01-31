class_name State
extends Node

var state_machine: NewStateMachine
var input: InputData

func set_input(new_input: InputData):
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
