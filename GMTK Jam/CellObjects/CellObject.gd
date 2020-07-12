extends Node2D

var mouse_over := false
var follow_mouse := false
var placed := false
var cell: Area2D
var type := "CellObject"
var price := 100
export var health := 100
onready var initial_position := global_position
var can_explode := false

func _ready() -> void:
	$Objects.play(type)
	$ExplodeArea/CollisionShape2D.visible = false
	match type:
		"Turret":
			$TurretBulletTimer.start()
			price = 100
		"OilWell":
			$CoinTimer.start()
			price = 100
		"Shield": 
			price = 150
			health = 500
		"Dynamite": 
			price = 300
			$ExplodeArea/CollisionShape2D.visible = true
			can_explode = true

func _process(delta: float) -> void:
	if mouse_over and not placed:
		if Input.is_action_just_pressed("drag"):
			follow_mouse = true
		if Input.is_action_just_released("drag"):
			follow_mouse = false
			if cell != null and not cell.object_inside:
				global_position = cell.get_node("Pivot").global_position
				Global.get_node("hit").play()
				cell.object_inside = true
				get_parent().coins -= price
				placed = true
			else:
				self.queue_free()
	
	if follow_mouse:
		global_position = get_global_mouse_position()
	
	if can_explode and placed:
		$ExplodeTimer.start()
		can_explode = false

func shoot() -> void:
	var bullet: Area2D = Global.TURRET_BULLET.instance()
	bullet.global_position = global_position
	get_parent().add_child(bullet)

func spawn_coin() -> void:
	randomize()
	var coin: Area2D = Global.COIN.instance()
	coin.global_position = global_position + Vector2(rand_range(-50, 50), rand_range(-50, 50))
	Global.get_node("shoot").play()
	get_parent().add_child(coin)

func _on_TurretBulletTimer_timeout() -> void:
	if placed: 
		shoot()
		Global.get_node("shoot").play()

func _on_CoinTimer_timeout() -> void:
	if placed: spawn_coin()

func _on_CellObjectArea_area_entered(area: Area2D) -> void:
	if area.is_in_group("cells"):
		cell = area

func _on_CellObjectArea_area_exited(area: Area2D) -> void:
	if area.is_in_group("cells"):
		cell = null

func _on_CellObjectArea_mouse_entered() -> void:
	mouse_over = true

func _on_CellObjectArea_mouse_exited() -> void:
	mouse_over = false

func take_damage(dmg: int) -> void:
	health -= dmg
	if health <= 0:
		cell.object_inside = false
		queue_free()

func explode():
	for area in $ExplodeArea.get_overlapping_areas():
		if area.is_in_group("enemies"):
			area.take_damage(5000)
	var explosion = Global.EXPLOSION.instance()
	explosion.global_position = global_position
	get_parent().add_child(explosion)
	Global.get_node("explosion").play()
	take_damage(500)

func _on_ExplodeTimer_timeout():
	explode()
