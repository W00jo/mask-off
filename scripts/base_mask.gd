extends Area2D

class_name BaseMask

var duration := 10
signal mask_picked_up

func pick_up():
	emit_signal("mask_picked_up")
	queue_free()

func _ready() -> void:
	pass 


func _process(delta: float) -> void:
	if(Input.is_action_just_pressed("press_z")):
		pick_up()
