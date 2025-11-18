extends Node2D

@export var taunts : Array[String]
@export var whaitingLine : unit_spawner
@onready var random_taunt = taunts.pick_random()

func _ready() -> void:
	Autoload.resurses = 3
	

func _process(delta: float) -> void:
	var alive_units := []
	for unit in Autoload.units:
		if !is_instance_valid(unit):
			return
		if !unit.is_dead:
			alive_units.append(unit)
	
	if Input.is_action_just_pressed("ui_down"):
		if $Timer.is_stopped():
			$Timer.start()
		
		$CanvasLayer/Label.visible = true
	
	if $Timer.time_left >= 3:
		$CanvasLayer/Label.text = random_taunt
	else:
		$CanvasLayer/Label.text = str(int($Timer.time_left)+1)
	$CanvasLayer/Label.add_theme_font_size_override("font_size", 20 * (int($Timer.wait_time) - int($Timer.time_left+1)))
	
	
	$CanvasLayer/Label2.text = "resurses: " + str(Autoload.resurses)
	alive_units.clear()


func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://Scenes/main/main.tscn")
