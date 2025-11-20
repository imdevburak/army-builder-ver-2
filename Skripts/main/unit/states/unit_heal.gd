class_name unit_heal
extends State

@export_group("state conections")
@export var on_heal_finiched : State

@export_category("")
@export var unit : unit_base
@export var attack_hitbox : Attack_hitbox
@export var anim_player : AnimationPlayer

@export_category("variables")
@export var single_target : bool
@export var heal : int = 10
@export var knockback : int = 100

func Enter():
	pass


func Physics_update(_delta):
	
	anim_player.play("heal")
	
	if single_target:
		var rand_enemy = attack_hitbox.get_overlapping_bodies().pick_random()
		if is_instance_valid(rand_enemy):
			rand_enemy.health += heal
	
	else:
		var units = attack_hitbox.get_overlapping_bodies()
		for i in units.size():
			if is_instance_valid(units[i]) and units[i] is unit_base:
				units[i].health += heal
	
	
	#appies knockback
	var direcrion = Vector2.RIGHT.rotated(attack_hitbox.rotation)
	unit.velocity -= direcrion * knockback
	
	change_state.emit(self,on_heal_finiched.name)
