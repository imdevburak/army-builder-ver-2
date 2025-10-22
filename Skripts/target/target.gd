extends Sprite2D

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if Input.is_action_just_pressed("L_klick"):
			global_position = get_global_mouse_position()
