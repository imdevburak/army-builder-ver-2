class_name Bullet
extends Area2D


@export var damage : int = 10
@export var knockback : int = 100
@export var speed : int = 40
@export var texture : AnimatedSprite2D

@export var lifeTimeTimer : Timer


func _process(delta: float) -> void:
	if lifeTimeTimer.time_left == 0.0:
		queue_free()
	
	texture.global_rotation = 0.0
	global_position += Vector2.LEFT.rotated(global_rotation) * speed * delta
	if !get_overlapping_bodies().is_empty():
		for body in get_overlapping_bodies():
			if body is unit_base:
				var direction = global_position.direction_to(body.global_position)
				body.health -= damage
				body.target_velocity += direction * -knockback
		queue_free()
