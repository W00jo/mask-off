extends Node

class_name InputData

var move_left: String
var move_right: String
var jump: String
var attack: String

func _init(
	move_left: String,
	move_right: String,
	jump: String,
	attack: String
):
	self.move_left = move_left
	self.move_right = move_right
	self.jump = jump
	self.attack = attack
