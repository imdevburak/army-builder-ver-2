class_name AnimationManager
extends AnimatedSprite2D

@export var unit : unit_base
var mirrored : int
var prev_mirrored : int

func _process(delta: float) -> void:
<<<<<<< HEAD
	if parent.health <= 0:
		anim_sprite.position = Vector2.ZERO
		anim_sprite.play("dead")
		return
	
	var speed_sqeared = parent.velocity.x**2 + parent.velocity.y**2
=======
	var speed_sqeared = unit.velocity.x**2 + unit.velocity.y**2
>>>>>>> parent of e6bc8b6 (added a buch of stuff)
	if speed_sqeared > 200:
		play("default")
	else:
		play("idle")
		
	if unit.velocity.x > 0:
		flip_h = true
	else:
		flip_h = false
	
	speed_scale = sqrt(speed_sqeared) / 70
