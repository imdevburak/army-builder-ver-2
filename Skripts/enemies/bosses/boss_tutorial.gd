class_name Enemy
extends CharacterBody2D


@export var health : int = 100


func _physics_process(delta: float) -> void:
	if health <= 0:
		queue_free()
	print(health)
