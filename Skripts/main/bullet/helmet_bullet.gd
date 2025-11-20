class_name HelmetBullet
extends Bullet


var resorse = preload("res://Scenes/main/resourse.tscn")


func _on_body_entered(body: Node2D) -> void:
	var resorse_instanse = resorse.instantiate()
	
	resorse_instanse.top_level = true
	resorse_instanse.global_position = global_position
	
	add_sibling(resorse_instanse)
