class_name Enemy
extends CharacterBody2D

@export var hp_bar : ProgressBar

@export var health : int = 100
 
var target_velocity : Vector2 = Vector2.ZERO

func _ready() -> void:
	hp_bar.max_value = health

func _physics_process(delta: float) -> void:
	hp_bar.value = health
	
	if health <= 0:
		queue_free()
	
	velocity = lerp(velocity,target_velocity,0.1)
	
	move_and_slide()


func dash(speed : int):
	if Autoload.units.is_empty():
		return
	
	var target = Autoload.units.pick_random()
	if !is_instance_valid(target) or target.is_dead:
		return
	
	
	var dash_velocity = (target.global_position - global_position).normalized()
	
	velocity += dash_velocity * speed
