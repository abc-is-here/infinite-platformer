extends Area2D



func _on_body_entered(body: Node2D) -> void:
	if "player" in body.name:
		get_node("../../GameOver").game_over()
