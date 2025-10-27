class_name Enemy_attack
extends State


@export var AnimPlayer : AnimationPlayer

@export var attacks : Array[String]


func Enter():
	print("boss_attacking")
	
	AnimPlayer.play(attacks.pick_random())
	



func Physics_update(_delta):
	if !AnimPlayer.is_playing():
		change_state.emit(self,"idle")


func _attack(attack : String):
	pass
