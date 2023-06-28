extends Node2D

var turn_b1 = true

var base1 = 0
var base2 = 0

func _ready():
	base1 = get_node("BaseArea/Base")
	base2 = get_node("BaseArea/Base2")


func _process(delta):
	if not get_parent().get_node("Pipes").get("game_over"):
		base1.position.x += -70 * delta
		base2.position.x += -70 * delta
		
		if base2.position.x <= 0 and turn_b1:
			base1.position.x = 168
			turn_b1 = false
		if base1.position.x <= 0 and !turn_b1:
			base2.position.x = 168
			turn_b1 = true

func _on_base_area_body_entered(body):
	if not get_parent().get_node("Pipes").game_over:
		get_parent().get_node("Pipes").game_over = true
		get_parent().get_node("Sound/Hit").play()
		body.set_visible(false)
