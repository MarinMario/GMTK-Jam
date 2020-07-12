extends TextureButton

export var level := "res://World/World.tscn"

func _ready():
	$Label.text = name

func _on_LevelButton_pressed():
	get_tree().change_scene(level)
