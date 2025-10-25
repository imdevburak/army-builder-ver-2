class_name Bullet
extends Area2D

@export var sprite : Sprite2D


enum NamedEnum {big_red = 1, small_red = 10, ANOTHER_THING = -1}
@export var bullet_type: NamedEnum
@export var damage : int = 10
@export var knockback : int = 100
var speed : int




func _process(delta: float) -> void:
	global_position += Vector2.LEFT.rotated(global_rotation) * speed * delta
	



func _on_body_entered(body: Node2D) -> void:
	if body is unit_base:
		var direction = global_position.direction_to(body.global_position)
		body.health -= damage
		body.velocity = direction * -knockback
		queue_free()
	
	
