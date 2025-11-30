class_name AnimationManager
extends Node2D

@export var parent : CharacterBody2D
@export var anim_sprite : AnimatedSprite2D
var mirrored : int
var prev_mirrored : int

func _process(delta: float) -> void:
	if parent.health <= 0:
		anim_sprite.play("dead")
		return
	
	var speed_sqeared = parent.velocity.x**2 + parent.velocity.y**2
	if speed_sqeared > 200:
		anim_sprite.play("move")
	else:
		anim_sprite.play("idle")
	
	
	if parent.velocity.x > 0:
		mirrored = true
	else:
		mirrored = false
	
	
	if mirrored != prev_mirrored:
		anim_sprite.scale.x *= -1
	anim_sprite.speed_scale = sqrt(speed_sqeared) / 70
	prev_mirrored = mirrored
