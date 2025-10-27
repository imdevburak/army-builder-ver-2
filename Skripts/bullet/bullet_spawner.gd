extends Node2D

@onready var bullet = preload("res://Scenes/bullets/bullet.tscn")




func spawn_sircle_attack(number_of_bullets : int, speed : int, randomise_rotation : int):
	var random_rotation_offset = randi_range(-randomise_rotation,randomise_rotation) 
	for i in number_of_bullets + 1:
		var bullet_instanse = bullet.instantiate()
		bullet_instanse.speed = speed
		bullet_instanse.rotation_degrees = (360.0 / number_of_bullets) * i + random_rotation_offset
		add_child(bullet_instanse)
	


func spawn_target_attack(speed : int, randomise_rotation : int):
	var target = Autoload.units.pick_random()
	
	if !is_instance_valid(target):
		return
	
	elif target.is_dead():
		return
	
	var bullet_instanse = bullet.instantiate()
	print(target)
	bullet_instanse.speed = speed
	bullet_instanse.look_at(target.global_position - global_position)
	bullet_instanse.rotation_degrees += 180 + randi_range(-randomise_rotation,randomise_rotation) 
	add_child(bullet_instanse)
