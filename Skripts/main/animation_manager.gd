class_name AnimationManager
extends AnimatedSprite2D

@export var unit : unit_base
var mirrored : int
var prev_mirrored : int




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var spped_sqeared = unit.velocity.x**2 + unit.velocity.y**2
	if spped_sqeared > 200:
		play("default")
	else:
		play("idle")
		
	mirrored = unit.velocity.x / abs(unit.velocity.x)
	
	if prev_mirrored - mirrored != 0:
		scale.x *= -1
	
	prev_mirrored = mirrored
	
	speed_scale = sqrt(spped_sqeared) * 0.01
