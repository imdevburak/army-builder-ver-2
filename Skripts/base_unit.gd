class_name unit_base
extends CharacterBody2D


var selected :bool = false
var mouse_position : Vector2
var target : Sprite2D


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_up"):
		selected = !selected
		print("selected")
	
	mouse_position = get_global_mouse_position()
	
	move_and_slide()
	
