class_name push_bodes
extends Area2D

@export var body : CharacterBody2D

@export var forse : int = 20


func _process(delta: float) -> void:
	var overping_bodies = get_overlapping_bodies()
	
	if overping_bodies.size() == 1: 
		return
	
	for i in overping_bodies.size():
		if overping_bodies[i] is not unit_base:
			return
		var puch_direction = (body.global_position - overping_bodies[i].global_position).normalized()
		var distanse_multiplyer = clamp(abs(200 / body.global_position.distance_to(overping_bodies[i].global_position)),0.0,100.0)
		body.velocity += puch_direction * distanse_multiplyer * forse * delta
		print()
		
