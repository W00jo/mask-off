class_name FallState
extends State

var speed = 200

@onready var sprite: Sprite2D = $"../../Sprite2D"


func enter():
	pass

func physics_update(delta:float):
	owner.velocity.y += 980 * delta
	
	var direction = Input.get_axis(input.move_left,input.move_right)
	
	if direction < 0:
		sprite.flip_h = true
		owner.attack_parent.scale.x = -1
		owner.mask_skin.scale.x = -1
	elif direction > 0:
		sprite.flip_h = false
		owner.attack_parent.scale.x = 1
		owner.mask_skin.scale.x = 1
			
	owner.velocity.x = direction * speed
	
	#owner.velocity.x = direction * 200
	owner.move_and_slide()

	if owner.is_on_floor():
		owner.did_attack = false
		#owner.get_node("AnimationPlayer").play("land")
		#await $"../../AnimationPlayer".animation_finished
		if direction != 0:
			state_machine.change_state("walkstate")
			return
		else:
			state_machine.change_state("idlestate")
			return

func handle_input(_event: InputEvent):
	if Input.is_action_just_pressed(input.attack):
		state_machine.change_state("attackstate")
