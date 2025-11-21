extends Node2D

@export var taunts : Array[String]
@export var whaitingLine : unit_spawner
@onready var random_taunt = taunts.pick_random()

func _ready() -> void:
	Autoload.resurses = 3
	Autoload.units.clear()
	Autoload.enemies.clear()

func _process(delta: float) -> void:
	
	if Input.is_action_just_pressed("esc"):
		if $Timer.is_stopped():
			$Timer.start()
		
		$CanvasLayer/Label.visible = true
	
	if $Timer.time_left >= 3:
		$CanvasLayer/Label.text = random_taunt
	else:
		$CanvasLayer/Label.text = str(int($Timer.time_left)+1)
	$CanvasLayer/Label.add_theme_font_size_override("font_size", 20 * (int($Timer.wait_time) - int($Timer.time_left+1)))
	
	
	$CanvasLayer/Label2.text = "resurses: " + str(Autoload.resurses)
	


func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://Scenes/main/main.tscn")
