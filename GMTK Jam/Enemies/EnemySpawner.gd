extends Node2D

var spawn_timer := 0.0
onready var spawn_time := choose_random_time()
var min_time := 20
var max_time := 50

var can_spawn := false

func _process(delta: float) -> void:
	if can_spawn:
		spawn_timer += delta
		if spawn_timer > spawn_time:
			spawn_timer = 0
			spawn_enemy()
			spawn_time = choose_random_time()

func choose_random_time() -> int:
	randomize()
	min_time -= 1
	max_time -= 1
	var time: int = int(rand_range(min_time, max_time))
	return time

func spawn_enemy() -> void:
	var enemy := Global.ENEMY1.instance()
	enemy.global_position = global_position
	get_parent().add_child(enemy)

func _on_StartSpawningTimer_timeout():
	can_spawn = true
