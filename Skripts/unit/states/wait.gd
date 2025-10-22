class_name unit_wait
extends State

@export var unit : unit_base
@export var nav_agent : NavigationAgent2D

@export var friction : float = 0.5


func Enter():
	print("unit_wait")


func Physics_update(_delta):
	unit.velocity = lerp(unit.velocity,Vector2.ZERO,friction)
	
	if !nav_agent.is_target_reached():
		change_state.emit(self,"unit_move")
	
	if unit.selected == false:
		change_state.emit(self,"unit_idle")
