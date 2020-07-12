extends TextureButton

export var level := 1

func _process(delta):
	if level <= Global.unlocked_levels:
		$Lock.visible = false
	else:
		disabled = true
	$Label.text = name

func _on_LevelButton_pressed():
	Global.current_level = level
	get_tree().change_scene("res://World/World.tscn")
