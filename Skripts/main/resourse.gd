class_name resourse
extends Area2D

func _ready() -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	
	Autoload.resurses += 1
	
	queue_free()
