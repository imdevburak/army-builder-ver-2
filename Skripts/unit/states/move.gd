class_name unit_move
extends State

@export var unit : unit_base
@export var nav_agent : NavigationAgent2D
@export var attack_hitbox : Area2D
@export var attack_timer : Timer

@export var speed : int = 100


func Enter():
	print("unit_move")



func Physics_update(_delta):
	nav_agent.target_position = unit.target.global_position
	if !nav_agent.is_navigation_finished():
		
		var nav_point_direction = unit.to_local(nav_agent.get_next_path_position()).normalized()
		unit.target_velocity = nav_point_direction * speed
	else:
		change_state.emit(self,"unit_wait")
	
	if unit.selected == false:
		change_state.emit(self,"unit_idle")
	
	if attack_hitbox.get_overlapping_bodies().size() != 0 and attack_timer.is_stopped():
		change_state.emit(self,"unit_attack")
