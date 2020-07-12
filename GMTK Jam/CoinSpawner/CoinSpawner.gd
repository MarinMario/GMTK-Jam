extends Node2D

onready var screen := get_viewport_rect().size

func spawn_coin() -> void:
	randomize()
	var coin: Area2D = Global.COIN.instance()
	coin.global_position = Vector2(rand_range(100, screen.x - 100), rand_range(200, screen.y - 100))
	get_parent().add_child(coin)

func _on_Timer_timeout() -> void:
	spawn_coin()
