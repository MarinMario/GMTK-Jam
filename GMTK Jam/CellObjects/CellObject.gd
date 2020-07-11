extends Node2D

var mouse_over := false
var follow_mouse := false
var cell: Area2D
onready var initial_position := global_position

func _on_MouseArea_mouse_entered():
	mouse_over = true

func _on_MouseArea_mouse_exited():
	mouse_over = false

func _process(delta):
	if mouse_over:
		if Input.is_action_pressed("drag"):
			follow_mouse = true
		if Input.is_action_just_released("drag"):
			follow_mouse = false
			if cell != null:
				global_position = cell.get_node("Pivot").global_position
			else:
				global_position = initial_position
	
	if follow_mouse:
		global_position = get_global_mouse_position()

func _on_MouseArea_area_entered(area):
	if area.is_in_group("cells"):
		cell = area
		
