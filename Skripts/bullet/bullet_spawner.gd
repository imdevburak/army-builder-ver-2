extends Node2D

@onready var bullet = preload("res://Scenes/bullets/bullet.tscn")

@export var enemy : Enemy



func spawn_sircle_attack(number_of_bullets : int, speed : String):
	for i in number_of_bullets + 1:
		var bullet_instanse = bullet.instantiate()
		bullet_instanse.speed = speed
		bullet_instanse.rotation_degrees = (360.0 / number_of_bullets) * i
		add_child(bullet_instanse)
	


func spawn_target_attack(speed : String):
	var target = Autoload.units.pick_random()
	var bullet_instanse = bullet.instantiate()
	bullet_instanse.speed = speed
	bullet_instanse.look_at(target.global_position - global_position)
	bullet_instanse.rotation_degrees += 180
	add_child(bullet_instanse)
