class_name Attack_hitbox
extends Area2D

@export var unit : unit_base


func _process(delta: float) -> void:
	look_at(global_position + unit.velocity)
