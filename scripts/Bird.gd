extends CharacterBody2D

var index = [0, 1, 2].pick_random()

const SPEED = 300.0
const JUMP_VELOCITY = 300.0 * -1

var game_start = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func play_animation(index: int):
	if not get_parent().get_node("Pipes").get("game_over"):
		if index == 0:
			get_node("AnimatedSprite2D").play("flying_red")
		
		if index == 1:
			get_node("AnimatedSprite2D").play("flying_yellow")
			
		if index == 2:
			get_node("AnimatedSprite2D").play("flying_blue")

func _physics_process(delta):
	# Add the gravity.	
	if game_start and not get_parent().get_node("Pipes").get("game_over") :
		velocity.y += gravity * delta
	
	if get_parent().get_node("Pipes").get("game_over"):
		velocity.y = 0
		# this is temporary; will be replaced by the falling animation
	
	play_animation(index)
		
	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept"):
		if not get_parent().get_node("Pipes").get("game_over"):
			game_start = true
			velocity.y = JUMP_VELOCITY
			if get_node("AnimatedSprite2D").rotation > -0.25:
				get_node("AnimatedSprite2D").rotation = lerp(rotation, -0.25, 1)
			get_parent().get_node("Sound/Wing").play()

	if velocity.y > 250:
		get_node("AnimatedSprite2D").rotation = lerp(rotation, 0.25, 2)

	move_and_slide()
