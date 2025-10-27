class_name unit_attack
extends State

@export_group("state conections")
@export var on_attack_finiched : State

@export_category("")
@export var unit : unit_base
@export var attack_hitbox : Attack_hitbox
@export var anim_player : AnimationPlayer

@export_category("variables")
@export var single_target : bool
@export var damage : int = 10
@export var knockback : int = 100


func Enter():
	print("unit_attack")
	


func Physics_update(_delta):
	
	anim_player.play("attack")
	
	if single_target:
		var rand_enemy = attack_hitbox.get_overlapping_bodies().pick_random()
		if rand_enemy is Enemy and is_instance_valid(rand_enemy):
			rand_enemy.health -= damage
	
	#appies knockback
	var direcrion = Vector2.RIGHT.rotated(attack_hitbox.rotation)
	unit.velocity -= direcrion * knockback
	
	
	
	
	change_state.emit(self,on_attack_finiched.name)
