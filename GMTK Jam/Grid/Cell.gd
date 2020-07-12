extends Area2D

var color := Color(0.5,0.5,0.5)
var object_inside := false
var object_over := false

func _process(delta: float) -> void:
	$Sprite.modulate = color
	if object_inside or object_over:
		color = Color(0.3,0.3,0.3)
	else:
		color = Color(0.5,0.5,0.5)

func _on_Cell_area_entered(area: Area2D) -> void:
	if area.name == "CellObjectArea":
		object_over = true

func _on_Cell_area_exited(area: Area2D) -> void:
	if area.name == "CellObjectArea" and not object_inside:
		object_over = false
