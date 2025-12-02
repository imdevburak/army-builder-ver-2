extends Node


var units : Array[unit_base]
var enemies : Array[Enemy]

var resurses : int = 10


func _process(delta: float) -> void:
	print(units)
	#vr not_previusly_freed_units = []
	#for i in units.size():
	#	if is_instance_valid(units[i]):
	#		not_previusly_freed_units.append(units[i])
	#
	#
	#for i in not_previusly_freed_units.size():
	#	units.append(not_previusly_freed_units[i]) 
	#print(not_previusly_freed_units)
