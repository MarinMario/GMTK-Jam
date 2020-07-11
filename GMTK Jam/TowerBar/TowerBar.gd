extends Node2D

func _process(delta: float) -> void:
	$CoinIcon/CoinsLabel.text = String(Global.coins)
