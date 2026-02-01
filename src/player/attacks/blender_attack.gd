extends BaseAttack


@export var animName: String 
@onready var collider: CollisionShape2D = $BlenderArea/CollisionShape2D
@export var cube_scene: PackedScene 


func start_attack(player: Player):
	
	super(player)
	$BlenderArea.set_custom_parent(player)
	collider.disabled = false
	player.animation_player.play(animName)
	var initVel = player.velocity
	if(initVel.y > 0):
		initVel.y = 0
	player.velocity = Vector2(player.get_direction() * 900, 0)
	await get_tree().create_timer(0.1).timeout
	player.velocity = Vector2(initVel.x, 0)
	await player.animation_player.animation_finished
	player.velocity.y = 98
	collider.disabled = true
	print("blender atak ")
	attack_finished.emit()
	

func cube_throw():
	var new_cube = cube_scene.instantiate()
	print("spawnuje kubik")
	add_child(new_cube)
	
	
