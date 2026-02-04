extends Sprite2D

class_name MaskSkin

@onready var _animator := $AnimationPlayer

func play_anim(anim_name: String):
	_animator.play(anim_name)
