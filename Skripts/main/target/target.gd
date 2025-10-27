extends Sprite2D

func _unhandled_input(event: InputEvent) -> void:
	
	if Input.is_action_pressed("L_klick"):
		global_position = get_global_mouse_position()
