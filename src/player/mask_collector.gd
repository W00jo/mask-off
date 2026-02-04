extends Area2D

class_name MaskCollector

signal on_mask_picked_up(mask: MaskData)

func _on_area_entered(area: Area2D) -> void:
	if(area is CollectibleMask):
		on_mask_picked_up.emit(area.mask_data)
		area.pick_up()
