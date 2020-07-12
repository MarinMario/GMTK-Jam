extends Node2D

var price := 100
var can_buy := false

onready var world = get_parent().get_parent().get_parent()

func _ready() -> void:
	$Objects.play(name)
	match name:
		"OilWell", "Turret": price = 100
		"Shield": price = 150
		"Dynamite": price = 300
	$Price.text = String(price)

func _process(delta):
	can_buy = world.coins >= price
	$Lock.visible = !can_buy
	$SpawnObjectButton.disabled = !can_buy

func spawn_object() -> void:
	var object := Global.CELL_OBJECT.instance()
	object.type = name
	object.mouse_over = true
	world.add_child(object)

func _on_SpawnObjectButton_button_down() -> void:
	if can_buy:
		spawn_object()
