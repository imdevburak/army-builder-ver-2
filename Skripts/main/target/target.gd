class_name  move_target
extends AnimatedSprite2D

@export var unit : unit_base
@export var nav_agent : NavigationAgent2D


func _unhandled_input(event: InputEvent) -> void:
	
	if !unit.selected:
		visible = false
		return
	visible = true
	if Input.is_action_pressed("R_klick"):
		global_position = get_global_mouse_position()
		nav_agent.target_position = global_position
		
	
