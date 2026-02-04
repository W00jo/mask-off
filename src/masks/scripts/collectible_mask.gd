extends Area2D
class_name CollectibleMask

signal mask_picked_up(data: MaskData)

var duration := 10
var mask_data: MaskData
@export var debug = false
@export var debug_mask: MaskData
@onready var skin: MaskSkin = $MaskSkin


func _ready() -> void:
	if(debug):
		set_mask(debug_mask)
		
func set_mask(data: MaskData):
	mask_data = data
	skin.play_anim(mask_data.animation_name)
	
func pick_up():
	mask_picked_up.emit(mask_data)
	queue_free()


func _on_body_entered(body: Node2D) -> void:
	print("Mask: ",body)
