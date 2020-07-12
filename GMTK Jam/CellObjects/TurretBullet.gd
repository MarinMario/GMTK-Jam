extends Area2D

export var speed := 300

func _process(delta : float) -> void:
	global_position.x += delta * speed
	if global_position.x > 1300:
		queue_free()

func _on_TurretBullet_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemies"):
		area.take_damage(25)
		Global.get_node("hit").play()
		queue_free()
