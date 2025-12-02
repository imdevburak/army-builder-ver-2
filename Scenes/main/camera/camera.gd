class_name CameraController
extends Camera2D

var AXEL := 400
var axel = AXEL

func _process(delta: float) -> void:
	var direction = Input.get_vector("left","right","up","down")
	global_position += direction * axel * delta

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and Input.is_action_pressed("L_klick"):
		global_position -= event.relative
