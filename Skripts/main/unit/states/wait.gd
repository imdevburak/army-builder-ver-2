class_name unit_wait
extends State

@export_group("state conections")
@export var on_attack_hitbox_entered : State
@export var on_death : State
@export var on_navigation_not_finished : State

@export_group("")
@export var unit : unit_base
@export var nav_agent : NavigationAgent2D
@export var attack_hitbox : Area2D
@export var anim_player : AnimationPlayer


func Enter():
	print("unit_wait")


func Physics_update(_delta):
	
	var nav_point_direction = unit.to_local(nav_agent.get_next_path_position()).normalized()
	unit.target_velocity = Vector2.ZERO

	
	
	if attack_hitbox.get_overlapping_bodies().size() != 0 and !anim_player.is_playing():
		change_state.emit(self,on_attack_hitbox_entered.name)
	
	
	
	if !nav_agent.is_navigation_finished():
		change_state.emit(self,on_navigation_not_finished.name)
	
	
	
	if unit.health <= 0:
		change_state.emit(self,on_death.name)
	
	
