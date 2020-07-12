extends Node2D

func _process(delta: float) -> void:
	$CoinIcon/CoinsLabel.text = str(get_parent().coins)
	$EnemyCount/Label.text = "Enemies: " + str(get_parent().enemies_spawned) + "/" + str(get_parent().enemy_amount)
