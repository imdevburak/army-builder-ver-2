class_name Attack_hitbox
extends Area2D

@export var unit : unit_base
@export var lock_on_closest_enemy : bool
@export var lerp_strengh : float = 0.5

var target_look_pos : Vector2 = Vector2.ZERO

func _process(delta: float) -> void:
	if lock_on_closest_enemy:
		target_look_pos = lerp(target_look_pos,unit.closest_enemy.global_position,lerp_strengh)
		
	else:
		target_look_pos = lerp(target_look_pos,global_position + unit.velocity,lerp_strengh)
	
	look_at(target_look_pos)
