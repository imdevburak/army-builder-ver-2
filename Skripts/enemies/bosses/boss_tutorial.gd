class_name Enemy
extends CharacterBody2D

@export var hp_bar : ProgressBar

@export var health : int = 100
 
func _physics_process(delta: float) -> void:
	hp_bar.value = health
	
	if health <= 0:
		queue_free()
	
