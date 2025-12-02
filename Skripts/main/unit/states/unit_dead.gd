class_name unit_dead
extends State

@export var unit : unit_base
var resorse = preload("res://Scenes/main/resourse.tscn")
func Enter():
	unit.is_dead = true
	Autoload.units.erase(unit)
	Autoload.all_units.erase(unit)
	unit.hp_bar.visible = false
	if unit.holding_recourse:
		var resorse_instanse = resorse.instantiate()
		
		resorse_instanse.top_level = true
		resorse_instanse.global_position = unit.global_position
		
		add_sibling(resorse_instanse)
		
		unit.holding_recourse = false


func Physics_update(_delta):
	unit.target_velocity = Vector2.ZERO
