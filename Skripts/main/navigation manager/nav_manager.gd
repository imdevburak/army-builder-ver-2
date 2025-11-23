class_name nav_manager
extends NavigationRegion2D


var units :Array = []
var enemies : Array = []

func _process(delta: float) -> void:

	Autoload.enemies.clear()
	for child in get_children():
		
		if child is Enemy:
			
			enemies.push_back(child)
			Autoload.enemies.push_back(child)
		
	
