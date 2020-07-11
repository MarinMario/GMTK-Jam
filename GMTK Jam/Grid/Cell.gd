extends Area2D

func _on_Cell_area_entered(area):
	if area.name == "CellObjectArea":
		$Sprite.modulate = Color(0,0,0)

func _on_Cell_area_exited(area):
	if area.name == "CellObjectArea":
		$Sprite.modulate = Color(1,1,1)
