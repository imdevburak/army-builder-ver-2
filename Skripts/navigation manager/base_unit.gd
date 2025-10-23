class_name nav_manager
extends NavigationRegion2D

@export var target : Sprite2D

var units :Array = []
var enemies : Array = []

func _physics_process(delta: float) -> void:
	
	for child in get_children():
		if child is unit_base:
			units.push_back(child)
		
	
	for i in units.size():
		units[i].target = target
	
	
	enemies.clear()
	units.clear()
	
