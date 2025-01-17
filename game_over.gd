extends CanvasLayer


func game_over() -> void:
	get_tree().paused = true
	self.show()
	get_node("../ScoreLayer").hide()
	get_node("score").text = "Final Score: "+str(Global.score)

func _on_retry_button_pressed() -> void:
	Global.score = 0
	get_tree().paused = false
	get_tree().reload_current_scene()
