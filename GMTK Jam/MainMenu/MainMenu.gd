extends Node2D

func _ready():
	get_tree().paused = false

func _on_PLAY_pressed():
	get_tree().change_scene("res://World/World.tscn")

func _on_EXIT_pressed():
	get_tree().quit()
