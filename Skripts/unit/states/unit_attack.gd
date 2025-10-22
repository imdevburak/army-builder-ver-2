class_name unit_attack
extends State

@export var unit : unit_base
@export var attack_timer : Timer
@export var attack_hitbox : Attack_hitbox

@export_category("variables")
@export var attck_coldown : float
@export var single_target : bool
@export var damage : int = 10
@export var knockback : int = 100


func Enter():
	print("unit_attack")
	


func Physics_update(_delta):
	attack_timer.start(attck_coldown)
	
	if single_target:
		var rand_enemy = attack_hitbox.get_overlapping_bodies().pick_random()
		if rand_enemy is Enemy and is_instance_valid(rand_enemy):
			rand_enemy.health -= damage
	
	#appies knockback
	var direcrion = unit.velocity.normalized()
	unit.velocity -= direcrion * knockback
	
	
	
	
	change_state.emit(self,"unit_move")
