class_name unit_base
extends CharacterBody2D


@export var health : int = 100
@export var friction : float


var selected :bool = false
var mouse_position : Vector2
var target : Sprite2D
var target_velocity : Vector2


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_up"):
		selected = !selected
		print("selected")
	
	mouse_position = get_global_mouse_position()
	
	velocity = lerp(velocity,target_velocity,0.01)
	
	
	move_and_slide()
	
