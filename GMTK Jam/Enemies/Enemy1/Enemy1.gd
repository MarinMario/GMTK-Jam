extends Area2D

export var initial_speed := 100
onready var speed := initial_speed
export var damage := 30

export var health := 100

var object_to_attack: Node2D = null

func attack(cell_object: Node2D) -> void:
	$AnimationPlayer.play("attack")
	cell_object.take_damage(35)

func _process(delta: float) -> void:
	global_position.x -= speed * delta
	if global_position.x < -5:
		get_parent().lose()
	if object_to_attack == null:
		speed = initial_speed
	else:
		speed = 0

func _on_Enemy1_area_entered(area: Area2D) -> void:
	if area.name == "CellObjectArea":
		object_to_attack = area.get_parent()
		$AnimationPlayer.play("attack")

func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	if anim_name == "attack" and object_to_attack != null:
		attack(object_to_attack)

func take_damage(dmg: int) -> void:
	health -= dmg
	if health <= 0:
		get_parent().enemies_spawned += 1
		self.queue_free()
	
