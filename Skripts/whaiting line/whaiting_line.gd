class_name unit_spawner
extends Node2D

@export var puch_dir_x : float = 50
@export var puch_dir_y : float = 0
@export var line_size : int = 10
@export var cost : int
@export var unit_type : String 

@export_category("upgrade")
@export var can_upgrade : bool

@export_category("referenses")
@export var text_label : Label
@export var upgrade_area : Area2D

var mouse_inside_area : bool = false


func _ready() -> void:
	if !can_upgrade:
		text_label.text = str(line_size)

func _process(delta: float) -> void:
	
	if mouse_inside_area and Input.is_action_just_pressed("L_klick"):
		var basic_unit = load(unit_type)
		var unit_instanse = basic_unit.instantiate()
		if can_upgrade:
			for body in upgrade_area.get_overlapping_bodies():
				if body is unit_base and body.holding_recourse:
					unit_instanse.global_position = body.global_position
					unit_instanse.velocity = body.velocity
					unit_instanse.health = body.health
					Autoload.all_units.append(unit_instanse)
					add_sibling(unit_instanse)
					
					Autoload.units.erase(body)
					body.queue_free()
			
		elif line_size > 0:
			
			
			line_size -= 1
			text_label.text = str(line_size)
			unit_instanse.global_position = global_position
			unit_instanse.velocity = Vector2(puch_dir_x,puch_dir_y)
			Autoload.all_units.append(unit_instanse)
			add_sibling(unit_instanse)


func _on_area_2d_mouse_entered() -> void:
	mouse_inside_area = true
	print(mouse_inside_area)


func _on_area_2d_mouse_exited() -> void:
	mouse_inside_area = false
	print(mouse_inside_area)
