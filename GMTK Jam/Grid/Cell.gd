extends Area2D

var color := "#565656"

func _process(delta):
	$Sprite.modulate = color

func _on_Cell_area_entered(area):
	if area.name == "CellObjectArea":
		color = "#131313"

func _on_Cell_area_exited(area):
	if area.name == "CellObjectArea":
		color = "#565656"
