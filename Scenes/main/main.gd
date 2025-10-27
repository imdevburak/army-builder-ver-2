extends Node2D



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var alive_units := []
	for unit in Autoload.units:
		if !is_instance_valid(unit):
			return
		if !unit.is_dead:
			alive_units.append(unit)
	
	if Input.is_action_just_pressed("ui_down") or alive_units == []:
		if $Timer.is_stopped():
			$Timer.start()
		$CanvasLayer/Label.visible = true
	$CanvasLayer/Label.text = str(int($Timer.time_left+1))
	$CanvasLayer/Label.add_theme_font_size_override("font_size", 20 * (int($Timer.wait_time) - int($Timer.time_left) + 1))
	print(int($Timer.wait_time) - int($Timer.time_left))


func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://Scenes/main/main.tscn")
