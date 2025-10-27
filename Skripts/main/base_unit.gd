class_name unit_base
extends CharacterBody2D




@export var hp_bar : ProgressBar

@export var select_button : Button

@export var health : int = 100:
	set(new_health):
		health = clampi(new_health,0,max_health)
var max_health : int = health
@export var friction : float


var selected :bool = false
var is_dead : bool = false

var mouse_position : Vector2
var target : Sprite2D
var target_velocity : Vector2
var enemies : Array
var closest_enemy : Enemy

func _ready() -> void:
	hp_bar.value = health
	hp_bar.max_value = max_health


func _process(delta: float) -> void:
	
	hp_bar.value = health
	
	if is_dead:
		return
	
	#selects or deselects enemy
	if select_button.is_hovered():
		selected = true
		
	if Input.is_action_just_pressed("ui_up"):
		selected = false
	
	#calculates the closest enemy
	var closest_enemy_distanse = INF
	for i in enemies.size():
		if !is_instance_valid(enemies[i]):
			return
			
		var distanse = global_position.distance_to(enemies[i].global_position)
		if distanse < closest_enemy_distanse:
			closest_enemy = enemies[i]
			
			closest_enemy_distanse = distanse
			
	
	
	mouse_position = get_global_mouse_position()
	
	velocity = lerp(velocity,target_velocity,friction)
	
	enemies.clear()
	
	move_and_slide()
	
