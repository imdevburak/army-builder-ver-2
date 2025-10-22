class_name StateMashine
extends Node

@export var initial_state: State

var States :Dictionary = {}
var current_state: State

func _ready() -> void:
	for child in get_children():
		if child is State:
			States[child.name.to_lower()] = child
			child.change_state.connect(on_child_transition)
	
	if initial_state:
		current_state = initial_state
		initial_state.Enter()

func _process(delta: float) -> void:
	if current_state:
		current_state.Update(delta)

func _physics_process(delta: float) -> void:
	if current_state:
		current_state.Physics_update(delta)


func on_child_transition(state,new_state_name):
	if state != current_state:
		return
	
	var new_state = States.get(new_state_name.to_lower())
	if !new_state:
		return
	
	if current_state:
		current_state.Exit()
	
	new_state.Enter()
	
	current_state = new_state
	
