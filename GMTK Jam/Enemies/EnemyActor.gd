extends Area2D

class_name EnemyActor

export var initial_speed := 100
onready var speed := initial_speed
export var damage := 30

export var health := 100

func _process(delta: float) -> void:
	global_position.x -= speed * delta
