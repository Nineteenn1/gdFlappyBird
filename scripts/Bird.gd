extends CharacterBody2D

var bird_tex1 = preload("res://gfx/yellowbird-midflap.png")
var bird_tex2 = preload("res://gfx/bluebird-midflap.png")
var bird_tex3 = preload("res://gfx/redbird-midflap.png")

var bird_textures = [ bird_tex1, bird_tex2, bird_tex3 ]

var bird_sprite = 0

const SPEED = 300.0
const JUMP_VELOCITY = 300.0 * -1

var game_start = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	bird_sprite = get_node("Sprite2D")
	var index = [0, 1, 2].pick_random()
	bird_sprite.set_texture(bird_textures[index])


func _physics_process(delta):
	# Add the gravity.
	if game_start:
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept"):
		if not game_start or not get_parent().get_node("Pipes").get("game_over"):
			game_start = true
			velocity.y = JUMP_VELOCITY
			get_parent().get_node("Sound/Wing").play()

	#var collision = move_and_collide(velocity * delta * 0.2)

	move_and_slide()
