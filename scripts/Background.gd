extends Node2D

var background_tex1 = preload("res://gfx/background-day.png")
var background_tex2 = preload("res://gfx/background-night.png")

var background_textures = [ background_tex1, background_tex2 ]

var sprite1 = 0
var sprite2 = 0

func _ready():
	sprite1 = get_node("Sprite1")
	sprite2 = get_node("Sprite2")
	
	var index = [0,1].pick_random()
	sprite1.set_texture(background_textures[index])
	sprite2.set_texture(background_textures[index])


