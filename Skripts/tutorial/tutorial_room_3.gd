extends Node2D

var counter = 3

func _on_area_2d_body_entered(body: Node2D) -> void:
	if counter == 0:
		get_tree().change_scene_to_file("res://Scenes/tutorial/tutorial_room_4.tscn")
	counter -= 1
	$Polygon2D2/Label.text = str(counter) + "/3"
	body.queue_free()
	
