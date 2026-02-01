class_name DamageData

var damage_value: int
var knockback_data: KnockbackData

func _init(
	damage_value: int,
	from: Vector2 = Vector2.ZERO,
	knockback_strength: Vector2 = Vector2.ZERO
):
	self.damage_value = damage_value
	knockback_data = KnockbackData.new(from, knockback_strength)
