extends Area2D

func _on_coin_body_entered(body):
	print("монетка")
	queue_free()
