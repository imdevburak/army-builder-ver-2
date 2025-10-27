extends State

@export var AnimPlayer : AnimationPlayer

func Enter():
	print("boss_idleing")


func Physics_update(_delta):
	if !AnimPlayer.is_playing():
		change_state.emit(self,"attack")
