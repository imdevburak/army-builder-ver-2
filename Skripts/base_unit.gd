class_name unit_base
extends CharacterBody2D




@export var hp_bar : ProgressBar
@export var select_button : Button

@export var health : int = 100
@export var friction : float


var selected :bool = false
var is_dead : bool = false

var mouse_position : Vector2
var target : Sprite2D
var target_velocity : Vector2
var enemies : Array
var closest_enemy : Enemy


func _ready() -> void:
	hp_bar.max_value = health

func _process(delta: float) -> void:
	
	hp_bar.value = health
	
	#selects or deselects enemy
	if select_button.is_hovered():
		selected = true
		
	if Input.is_action_just_pressed("ui_up"):
		selected = false
	print(selected)
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
	
	velocity = lerp(velocity,target_velocity,0.01)
	
	enemies.clear()
	
	move_and_slide()
	
