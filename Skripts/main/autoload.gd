extends Node


var units : Array[unit_base]
var enemies : Array[Enemy]

var resurses : int = 10


func _physics_process(delta: float) -> void:
	units.clear()
	var not_previusly_freed_units = []
	for i in units.size():
		if is_instance_valid(units[i]):
			not_previusly_freed_units.append(units[i])
	units = []
	for i in not_previusly_freed_units.size():
		units.append(not_previusly_freed_units[i]) 
	
