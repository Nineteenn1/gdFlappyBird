extends Node2D

var restart_button = 0
var quit_button = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	restart_button = get_node("TextureButton")
	quit_button = get_node("TextureButton2")
	
	restart_button.pressed.connect(self.restart)
	quit_button.pressed.connect(self.quit)

func _process(delta):
	set_visible(get_parent().get_parent().get_node("Pipes").get("game_over"))
	
	
func restart():
	get_tree().reload_current_scene()

func quit():
	get_tree().quit()
