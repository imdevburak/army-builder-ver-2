class_name unit_move
extends State

@export var unit : unit_base
@export var nav_agent : NavigationAgent2D

@export var speed : int = 100
@export var axel : float = 0.05


func Enter():
	print("unit_move")



func Physics_update(_delta):
	nav_agent.target_position = unit.target.global_position
	if !nav_agent.is_target_reached():
		
		var nav_point_direction = unit.to_local(nav_agent.get_next_path_position()).normalized()
		var target_velocity = nav_point_direction * speed
		unit.velocity = lerp(unit.velocity,target_velocity,axel)
	else:
		change_state.emit(self,"unit_wait")
	
	if unit.selected == false:
		change_state.emit(self,"unit_idle")
