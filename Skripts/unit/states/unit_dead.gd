extends State

@export var unit : unit_base

func Enter():
	unit.queue_free()


func Physics_update(_delta):
	pass
