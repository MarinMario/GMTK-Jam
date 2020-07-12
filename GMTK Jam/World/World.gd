extends Node2D

export var enemy_amount := 30
export var coins := 100
var enemies_spawned := 0
export var enemy_types := [1,2]

func _ready():
	$PauseMenu.visible = false
	get_tree().paused = false

func lose():
	get_tree().paused = true
	$PauseMenu.visible = true
	$PauseMenu/State.text = "You Lose"

func win():
	get_tree().paused = true
	$PauseMenu.visible = true
	$PauseMenu/State.text = "You Win"

func _on_RESTART_pressed():
	get_tree().reload_current_scene()

func _on_EXIT_pressed():
	get_tree().change_scene("res://MainMenu/MainMenu.tscn")

func _on_PAUSE_pressed():
	get_tree().paused = !get_tree().paused
	$PauseMenu.visible = get_tree().paused
