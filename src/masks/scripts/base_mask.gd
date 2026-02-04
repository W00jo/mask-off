class_name BaseMask
extends Node2D

var type
@onready var anim:AnimationPlayer = $AnimationPlayer
@export var anim_name: String


func setup_animation():
	anim.play(anim_name)
