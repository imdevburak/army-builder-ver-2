class_name nav_manager
extends NavigationRegion2D

@export var target : Sprite2D

var units :Array = []
var enemies : Array = []

func _process(delta: float) -> void:

	Autoload.enemies.clear()
	for child in get_children():
		
		if child is Enemy:
			enemies.push_back(child)
			Autoload.enemies.push_back(child)
		
	
	
	
	
	'''enemies.clear()
	units.clear()
	Autoload.enemies.clear()
	Autoload.units.clear()'''
	
	
	
