class_name AttackManager
extends Node2D

@export var AnimPlayer : AnimationPlayer
@onready var attacks_names := AnimPlayer.get_animation_list()

var previous_attack := ""
var rand_attack := ""

func _ready() -> void:
	rand_attack = attacks_names[randi() % attacks_names.size()]
	previous_attack = rand_attack

func _physics_process(delta: float) -> void:
	
	if AnimPlayer.is_playing() or Autoload.units.is_empty():
		return
	while rand_attack == previous_attack:
		rand_attack = attacks_names[randi() % attacks_names.size()]
	AnimPlayer.play(rand_attack)
	previous_attack = rand_attack



func closest_unit():
	var units = Autoload.units
	var closest_enemy_distanse = 999999999999
	var closest = null
	if units.is_empty():
		return null
	
	for unit in units:
		if unit.global_position.distance_to(global_position) < closest_enemy_distanse:
			closest_enemy_distanse = unit.global_position.distance_to(global_position)
			closest = unit
	return closest
