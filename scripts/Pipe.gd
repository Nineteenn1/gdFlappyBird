extends Node2D

class_name Pipe

var score = 0
var pipes = 0

var game_over = false
var intro_screen = true

var rng = RandomNumberGenerator.new()

var game_over_tex = preload("res://gfx/gameover.png")

func _ready():
	pipes = [ get_parent().get_node("Pipes/Pipe1"), get_parent().get_node("Pipes/Pipe2"), 
get_parent().get_node("Pipes/Pipe3"), get_parent().get_node("Pipes/Pipe4") ]


func _process(delta):
	for pipe in pipes:
		if not game_over and get_parent().get_node("Bird").get("game_start"):
			pipe.position.x += 	-70 * delta
			if pipe.position.x < -300: # different than 0
				pipe.position.y = rng.randi_range(-107, 60)
				pipe.position.x = 555
	if get_parent().get_node("Bird").get("game_start") and intro_screen:
		get_parent().get_node("UI/GameStart").set_texture(null)
		intro_screen = false
	if get_parent().get_node("Pipes").get("game_over"):
		get_parent().get_node("UI/GameOver").set_texture(game_over_tex)


func _on_score_trigger_body_entered(body):
	score += 1
	get_parent().get_node("UI/Score").text = str(score)
	get_parent().get_node("Sound/Point").play()


func _on_pipe_body_entered(body):
	# play death 	animation (maybe)
	body.set_visible(false)
	game_over = true
	get_parent().get_node("Sound/Hit").play()

