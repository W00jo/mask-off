class_name WearBaseMask
extends Node2D

var type
@onready var anim:AnimationPlayer = $AnimationPlayer
@export var anim_name: String

func set_type(mask):
	type = mask
	setup_animation()
	# TODO: setup special attacks

func setup_animation():
	anim.play(anim_name)
