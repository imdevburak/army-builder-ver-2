class_name BulletSpawner
extends Node2D

@onready var bullet :Dictionary[PackedScene,String] = {
	preload("res://Scenes/main/bullets/bullet.tscn"):"",
	preload("res://Scenes/main/bullets/fire_bullet.tscn"):"fire bullet",
	preload("res://Scenes/main/bullets/helmet_bullet.tscn"):"helmet bullet",
	preload("res://Scenes/main/bullets/dummy_bullet.tscn"):"dummy bullet"
	}



func closest_unit():
	var units = Autoload.units
	var closest_enemy_distanse = 999999999999
	
	if units.is_empty():
		return null
	
	for unit in units:
		if unit.global_position.distance_to(global_position) < closest_enemy_distanse:
			closest_enemy_distanse = unit.global_position.distance_to(global_position)
			return unit



func spawn_attack(bullet_type : String, rot_deg : float):
	var bullet_instanse = bullet.find_key(bullet_type).instantiate()
	bullet_instanse.top_level = true
	bullet_instanse.global_position = global_position
	bullet_instanse.rotation_degrees = rot_deg
	
	add_child(bullet_instanse)



func spawn_sircle_attack(bullet_type : String, number_of_bullets : int, randomise_rotation : int):
	var random_rotation_offset = randi_range(-randomise_rotation,randomise_rotation) 
	for i in number_of_bullets:
		var bullet_instanse = bullet.find_key(bullet_type).instantiate()
		
		bullet_instanse.rotation_degrees = (360.0 / number_of_bullets) * i + random_rotation_offset
		
		bullet_instanse.top_level = true
		bullet_instanse.global_position = global_position
		
		add_child(bullet_instanse)
	


func spawn_target_attack(bullet_type : String, randomise_rotation : int):
	if Autoload.units.is_empty():
		return
	
	var target = closest_unit()
	
	if !is_instance_valid(target) or target.is_dead:
		return
	
	var bullet_instanse = bullet.find_key(bullet_type).instantiate()
	
	
	bullet_instanse.look_at(target.global_position - global_position)
	bullet_instanse.rotation_degrees += 180 + randi_range(-randomise_rotation,randomise_rotation) 
	
	bullet_instanse.top_level = true
	bullet_instanse.global_position = global_position
	
	add_child(bullet_instanse)
