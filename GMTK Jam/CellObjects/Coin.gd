extends Area2D

var mouse_over := false

func _ready():
	$AnimationPlayer.play("ready")

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("drag") and mouse_over:
		$CollisionShape2D.disabled = true
		$AnimationPlayer.play("over")
		Global.get_node("hit").play()
		get_parent().coins += 50

func _on_Coin_mouse_entered() -> void:
	mouse_over = true

func _on_Coin_mouse_exited() -> void:
	mouse_over = false

func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	if anim_name == "over":
		queue_free()
