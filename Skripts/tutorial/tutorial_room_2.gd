extends Node2D

@export var unit : unit_base

func _on_area_2d_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file("res://Scenes/tutorial/tutorial_room_3.tscn")

func _physics_process(delta: float) -> void:
	if unit.health <= 0:
		var basic_unit = load("res://Scenes/main/units/unit_no_upgrades.tscn")
		var unit_instanse = basic_unit.instantiate()
		unit_instanse.global_position = Vector2(88.0,192.0)
		$"navigation manger".add_child(unit_instanse)
		unit = unit_instanse
