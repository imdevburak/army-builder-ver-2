extends Node


var units : Array[unit_base]
var enemies : Array[Enemy]

func _process(delta: float) -> void:
	var not_previusly_freed_units = []
	for i in units.size():
		if is_instance_valid(units[i]):
			not_previusly_freed_units.append(units[i])
	units = []
	for i in not_previusly_freed_units.size():
		units.append(not_previusly_freed_units[i]) 
	
