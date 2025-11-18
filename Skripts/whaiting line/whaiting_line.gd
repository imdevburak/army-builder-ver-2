class_name unit_spawner
extends Node2D

@export var puch_dir_deg : int = 90
@export var line_size : int = 10
@export var cost : int

@export var label : Label
@export var button : Button

@export var unit_type : String 

@onready var basic_unit = load(unit_type)

func _process(delta: float) -> void:
	label.text = str(line_size)
	
	if button.is_hovered() and Input.is_action_just_pressed("L_klick"):
		if Autoload.resurses < cost:
			return
		line_size -= 1
		
		Autoload.resurses -= cost
		var basic_unit_instanse = basic_unit.instantiate()
		basic_unit_instanse.global_position = global_position
		basic_unit_instanse.velocity += Vector2.UP.rotated(deg_to_rad(puch_dir_deg))
		add_sibling(basic_unit_instanse)
	
