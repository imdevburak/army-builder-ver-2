class_name unit_idle
extends State


@export var unit : unit_base
@export var nav_agent : NavigationAgent2D


func Enter():
	print("unit_idle")


func Physics_update(_delta):
	nav_agent.target_position = unit.target.global_position
	unit.target_velocity = Vector2.ZERO
	
	if unit.selected:
		change_state.emit(self,"unit_wait")
	
