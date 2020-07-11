extends Node2D

export var width := 8
export var height := 4
const cell_size := 128

func _ready() -> void:
	for x in width:
		for y in height:
			add_cell(Vector2(x, y) * cell_size)

func add_cell(pos: Vector2) -> void:
	var cell := Global.CELL.instance()
	cell.position = pos
	add_child(cell)
