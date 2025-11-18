class_name FireBullet
extends Bullet

@export var scale_strengh : float

func _physics_process(delta: float) -> void:
	var scale_mod = (lifeTimeTimer.wait_time - lifeTimeTimer.time_left) * scale_strengh
	scale = Vector2(1,1) * scale_mod
