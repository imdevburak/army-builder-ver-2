class_name nav_manager
extends NavigationRegion2D

@export var target : Sprite2D

var units :Array = []
var enemies : Array = []

func _ready() -> void:
	
	for child in get_children():
		if child is unit_base:
			if child.is_dead == true:
				return
			units.push_back(child)
			Autoload.units.push_back(child)
		
		if child is Enemy:
			enemies.push_back(child)
			Autoload.enemies.push_back(child)
		
	
	for i in units.size():
		units[i].target = target
	
	
	
	'''enemies.clear()
	units.clear()
	Autoload.enemies.clear()
	Autoload.units.clear()'''
	
	
	
