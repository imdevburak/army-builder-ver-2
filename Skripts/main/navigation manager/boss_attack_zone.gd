extends Area2D


func _on_body_entered(body: Node2D) -> void:
	Autoload.units.append(body)


func _on_body_exited(body: Node2D) -> void:
	Autoload.units.erase(body)
