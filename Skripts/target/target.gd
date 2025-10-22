extends Sprite2D

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		global_position = get_global_mouse_position()
