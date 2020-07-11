extends Area2D

var color := Color(0.5,0.5,0.5)
var object_inside := false

func _process(delta):
	$Sprite.modulate = color
	if object_inside:
		color = Color(0.3,0.3,0.3)

func _on_Cell_area_entered(area):
	if area.name == "CellObjectArea":
		color = Color(0.3,0.3,0.3)

func _on_Cell_area_exited(area):
	if area.name == "CellObjectArea" and not object_inside:
		color = Color(0.5,0.5,0.5)
