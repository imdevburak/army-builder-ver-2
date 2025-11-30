extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"navigation manger/assasin".health = $"navigation manger/assasin".max_health / 2



func _on_area_2d_body_entered(body: Node2D) -> void:
	$Label.visible = true
	$"how to select".visible = true
	$Label2.visible = false


func _on_goalarea_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file("res://Scenes/tutorial/tutorial_room_5.tscn")


func _on_heal_tutorial_body_entered(body: Node2D) -> void:
	$"navigation manger/assasin".visible = true
	$heal_tutorial/Label.visible = true
