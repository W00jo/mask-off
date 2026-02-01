extends BaseAttack

@export var animName: String 
@onready var collider := $Area2D/CollisionShape2D


func start_attack(player: Player):
	super(player)
	collider.disabled = false
	player.animation_player.play(animName)
	await player.animation_player.animation_finished
	collider.disabled = true
	attack_finished.emit()
