extends Node2D

@export var taunts : Array[String]
@export var whaitingLine : unit_spawner
@onready var random_taunt = taunts.pick_random()

func _ready() -> void:
	Autoload.units.clear()
	Autoload.enemies.clear()
	Autoload.game_win = false

func _physics_process(delta: float) -> void:
	
	if Input.is_action_just_pressed("esc") or Autoload.game_win or ($"navigation manger/unit_spawner".line_size == 0 and Autoload.all_units.is_empty()):
		if $Timer.is_stopped():
			$Timer.start()
		
		$CanvasLayer/Label.visible = true
	if Autoload.game_win:
		$CanvasLayer/Label.text = "YOU WIN!"
	elif $Timer.time_left >= 3:
		$CanvasLayer/Label.text = random_taunt
	else:
		$CanvasLayer/Label.text = str(int($Timer.time_left)+1)
		$CanvasLayer/Label.add_theme_font_size_override("font_size", 20 * (int($Timer.wait_time) - int($Timer.time_left+1)))
	


func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://Scenes/ui/main_menu.tscn")
