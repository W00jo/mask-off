extends Button

@export var max_rotation : float = 5.0 
@export var shake_speed : float = 0.1

var is_hovering : bool = false

func _ready():
	pivot_offset = size / 4 
	mouse_entered.connect(_start_shaking)
	mouse_exited.connect(_stop_shaking)

func _start_shaking():
	is_hovering = true
	_run_shake_cycle()

func _run_shake_cycle():
	if not is_hovering:
		return

	var tween = create_tween().set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	
	var target_rotation = deg_to_rad(randf_range(-max_rotation, max_rotation))
	
	tween.tween_property(self, "rotation", target_rotation, shake_speed)
	
	tween.finished.connect(_run_shake_cycle)

func _stop_shaking():
	is_hovering = false
	var tween = create_tween().set_trans(Tween.TRANS_SINE)
	tween.tween_property(self, "rotation", 0.0, 0.5)
