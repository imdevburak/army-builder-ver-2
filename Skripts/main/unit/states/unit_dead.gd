class_name unit_dead
extends State

@export var unit : unit_base

func Enter():
	unit.is_dead = true
	Autoload.units.erase(unit)
	Autoload.all_units.erase(unit)
	unit.hp_bar.visible = false


func Physics_update(_delta):
	unit.target_velocity = Vector2.ZERO
