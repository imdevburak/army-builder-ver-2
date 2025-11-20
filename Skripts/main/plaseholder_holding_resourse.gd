extends Sprite2D


@export var unit : unit_base

func _physics_process(delta: float) -> void:
	if unit.holding_recourse:
		visible = true
	else:
		visible = false
