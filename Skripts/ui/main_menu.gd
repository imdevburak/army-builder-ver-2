extends Control





func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main/main.tscn")


func _on_exit_pressed() -> void:
	get_tree().quit()


func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/tutorial/tutorial_room_1.tscn")
