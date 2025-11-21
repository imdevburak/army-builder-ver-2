extends Node2D

func _process(delta: float) -> void:
	if $"navigation manger/unit_no_upgrades".selected:
		$gogogo.visible = true
		$"how to select".visible = false
		$Label.visible = false


func _on_area_2d_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file("res://Scenes/tutorial/tutorial_room_2.tscn")
