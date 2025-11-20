class_name resourse
extends Area2D

func _ready() -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	if body is unit_base:
		if body.is_dead or body.holding_recourse:
			return
		body.holding_recourse = true
		queue_free()
