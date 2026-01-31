class_name WearBaseMask
extends Node2D

@onready var sprite:Sprite2D = $Sprite2D
var type

func set_type(mask):
	type = mask
	setup_sprite()
	

func setup_sprite():
	sprite.texture = GameManager.mask_types.get(type)
