extends Control




func _on_play_again_pressed():
	get_tree().change_scene_to_file("res://entities_scenes/training_level.tscn")
	pass # Replace with function body.
	
func _on_quit_pressed():
	get_tree().quit()
	pass # Replace with function body.
