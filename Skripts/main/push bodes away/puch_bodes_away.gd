class_name push_bodes
extends Area2D

@export var unit : CharacterBody2D

@export var forse : int = 20


func _process(delta: float) -> void:
	var overping_bodies = get_overlapping_areas()
	
	
	for body in overping_bodies:
		if body is not push_bodes:
			return
		var puch_direction = (global_position - body.global_position).normalized()
		var distanse_multiplyer = clamp(abs(200 / global_position.distance_to(body.global_position)),0.0,1000.0)
		
		unit.velocity += puch_direction * distanse_multiplyer * forse
		print(puch_direction * forse)
		
		
