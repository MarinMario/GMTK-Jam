extends Node2D

export var width := 8
export var height := 5
const cell_size := 64
export var cell_scale := 1.5

func _ready() -> void:
	for x in width:
		for y in height:
			add_cell(Vector2(x, y) * cell_size * cell_scale)

func add_cell(pos: Vector2) -> void:
	var cell := Global.CELL.instance()
	cell.scale = Vector2(cell_scale, cell_scale)
	cell.position = pos
	add_child(cell)
