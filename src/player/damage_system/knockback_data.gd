extends Node

class_name KnockbackData

var from: Vector2 
var force: Vector2

static func zero(): 
	return KnockbackData.new(Vector2.ZERO, Vector2.ZERO)

func _init(
	from: Vector2,
	force: Vector2):
		self.from = from
		self.force = force
