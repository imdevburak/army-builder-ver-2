class_name unit_dead
extends State

@export var unit : unit_base

func Enter():
	unit.is_dead = true


func Physics_update(_delta):
	unit.target_velocity = Vector2.ZERO
