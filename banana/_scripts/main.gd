extends Node2D




func _on_player_win() -> void:
	get_tree().change_scene_to_file("res://_scenes/end.tscn")


func _on_player_ded() -> void:
	pass # Replace with function body.
