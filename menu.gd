extends Node2D


func _ready():
	$Play.pressed.connect(_on_play_pressed)
	$Quit.pressed.connect(_on_quit_pressed)

func _on_play_pressed():
	get_tree().change_scene_to_file("res://Lvl/lvl_pattern.tscn")

func _on_quit_pressed():
	get_tree().quit()
