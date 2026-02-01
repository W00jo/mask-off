class_name DamageData

var damage_value: int
var from: Vector2

func _init(
	damage_value: int,
	from:Vector2 = Vector2(0, 0)
):
	self.damage_value = damage_value
	self.from = from
