class_name Bullet
extends Area2D

@export var sprite : Sprite2D


enum NamedEnum {big_red = 1, small_red = 10, ANOTHER_THING = -1}
@export var bullet_type: NamedEnum
var speed : int




func _ready() -> void:
	pass



func _process(delta: float) -> void:
	global_position += Vector2.LEFT.rotated(global_rotation) * speed
