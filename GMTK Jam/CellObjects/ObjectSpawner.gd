extends Node2D

func _ready() -> void:
	$Objects.play(name)

func spawn_object() -> void:
	var object := Global.CELL_OBJECT.instance()
	object.type = name
	object.mouse_over = true
	get_parent().add_child(object)

func _on_SpawnObjectButton_button_down() -> void:
	spawn_object()
