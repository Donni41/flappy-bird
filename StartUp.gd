extends Control


func _on_start_game_pressed():
	get_tree().change_scene_to_file("res://main.tscn")


func _on_records_pressed():
	get_tree().change_scene_to_file("res://Records.tscn")


func _on_quit_pressed():
	get_tree().quit()
