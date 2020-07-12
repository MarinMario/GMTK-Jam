extends Node2D

var spawn_timer := 0.0
onready var spawn_time := choose_random_time()
var min_time := 10
var max_time := 30

var enemies_spawned := 0

var can_spawn := false

func _process(delta: float) -> void:
	if can_spawn:
		spawn_timer += delta
		if spawn_timer > spawn_time:
			spawn_timer = 0
			spawn_enemy()
			spawn_time = choose_random_time()
	
	if get_parent().enemies_spawned >= get_parent().enemy_amount:
		queue_free()

func choose_random_time() -> int:
	randomize()
	min_time -= 1 if min_time > 0 else 0
	max_time -= 2 if max_time > 5 else 0
	var time: int = int(rand_range(min_time, max_time))
	return time

func spawn_enemy() -> void:
	randomize()
	var et = get_parent().enemy_types
	var random_enemy: int = et[randi() % et.size() - 1]
	var enemy: Area2D
	match random_enemy:
		1: enemy = Global.ENEMY1.instance()
		2: enemy = Global.ENEMY1PRO.instance()
	var spawn_pos: Vector2 = get_node(str(randi() % 4 + 1)).global_position
	enemy.global_position = spawn_pos
	get_parent().add_child(enemy)
	get_parent().enemies_spawned += 1

func _on_StartSpawningTimer_timeout():
	can_spawn = true
