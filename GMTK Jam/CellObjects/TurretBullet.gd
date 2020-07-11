extends Area2D

export var speed := 300

func _process(delta : float) -> void:
	global_position.x += delta * speed
	if global_position.x > 2000:
		queue_free()
