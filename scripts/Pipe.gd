extends Node2D

class_name Pipe

var score = 0
var pipes = 0

var game_over = false
var intro_screen = true

var rng = RandomNumberGenerator.new()

# var index = pick random from 0, 1, 2, 3
# instantiate pipe[index] at position = lastposition + 100

# Called when the node enters the scene tree for the first time.
func _ready():
	pipes = [ get_parent().get_node("Pipes/Pipe1"), get_parent().get_node("Pipes/Pipe2"), 
get_parent().get_node("Pipes/Pipe3"), get_parent().get_node("Pipes/Pipe4") ]


func _process(delta):
	for pipe in pipes:
		print(pipe.position.y)
		if not game_over and get_parent().get_node("Bird").get("game_start"):
			pipe.position.x += 	-70 * delta
			if pipe.position.x < -300: # different than 0
				pipe.position.y = rng.randi_range(-107, 37)
				pipe.position.x = 555
	if get_parent().get_node("Bird").get("game_start") and intro_screen:
		get_parent().get_node("Message").queue_free()
		intro_screen = false


func _on_score_trigger_body_entered(body):
	score += 1
	get_parent().get_node("Score").text = str(score)
	get_parent().get_node("Sound/Point").play()


func _on_pipe_body_entered(body):
	print("game over christopher")
	# game_over
	# play death 	animation
	game_over = true
	get_parent().get_node("Sound/Hit").play()

