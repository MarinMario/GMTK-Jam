extends Node2D

var enemy_amount := 30
var coins := 100000
var enemies_spawned := 0
var enemy_types := [1,2]

func _ready():
	$PauseMenu/Buttons/NEXT.level = Global.current_level + 1
	$PauseMenu.visible = false
	get_tree().paused = false
	match Global.current_level:
		1:
			enemy_amount = 20
			enemy_types = [1]
		2:
			enemy_amount = 25
			enemy_types = [1,1,1,1,2]
		3:
			enemy_amount = 30
			enemy_types = [1,1,1,2]

func lose():
	$PauseMenu.visible = true
	$PauseMenu/State.text = "You Lose"

func win():
	$PauseMenu.visible = true
	Global.unlocked_levels += 1
	$PauseMenu/State.text = "You Win"

func _on_RESTART_pressed():
	get_tree().reload_current_scene()

func _on_EXIT_pressed():
	get_tree().change_scene("res://MainMenu/MainMenu.tscn")

func _on_PAUSE_pressed():
	get_tree().paused = !get_tree().paused
	$PauseMenu.visible = get_tree().paused
