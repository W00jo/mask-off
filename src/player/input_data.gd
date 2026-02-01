class_name InputData
extends Node


var move_left: String
var move_right: String
var jump: String
var attack: String

func _init(
	_move_left: String,
	_move_right: String,
	_jump: String,
	_attack: String
):
	self.move_left = _move_left
	self.move_right = _move_right
	self.jump = _jump
	self.attack = _attack
