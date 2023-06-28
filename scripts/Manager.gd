extends Node2D


var save_path = "res://save/score.txt"
var high_score = 0

func _ready():	
	var file = FileAccess.open(save_path, FileAccess.READ)
	if !file.get_length() == 0:
		load_score()

func save_score():
	if high_score == 0 or high_score == null:
		var file = FileAccess.open(save_path, FileAccess.WRITE)
		file.store_var(get_parent().get_node("Pipes").get("score"))
	else:	
		var file = FileAccess.open(save_path, FileAccess.WRITE)
		file.store_var(high_score)

func load_score():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		high_score = file.get_var()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(high_score)
	if get_parent().get_node("Pipes").get("score") > high_score:
		high_score = get_parent().get_node("Pipes").get("score") 
		save_score()
		
	if get_parent().get_node("Pipes").get("game_over"):
		get_parent().get_node("UI/ScoreDisplay").set_visible(true)
		get_parent().get_node("UI/Score").set_visible(false)
		get_parent().get_node("UI/ScoreDisplay/Score2").text = str(high_score)
		get_parent().get_node("UI/ScoreDisplay/Score3").text = str(get_parent().get_node("Pipes").get("score"))
