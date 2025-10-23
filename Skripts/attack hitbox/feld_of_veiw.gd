class_name Feld_of_veiw
extends Area2D

var closest_enemy : Enemy

func _physics_process(delta: float) -> void:
	var overlapping_bodies = get_overlapping_bodies()
	var closest_enemy_distanse = 999999999999
	
	if overlapping_bodies.size() == 0:
		closest_enemy = null
		return
	
	for i in overlapping_bodies.size():
		var body = overlapping_bodies[i]
		
		if body is Enemy:
			if body.global_position.distance_to(global_position) < closest_enemy_distanse:
				closest_enemy_distanse = body.global_position.distance_to(global_position)
				closest_enemy = body
