# Zellen-Skript 
extends Area2D 
 
signal cell_pressed(index: int) 
 
var cell_index: int = 0 
var cell_value: int = 0 # 0: leer, 1: X, 2: O 
 
func _on_input_event(_viewport, event: InputEvent, _shape_idx: int) -> void: 
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT: 
		emit_signal("cell_pressed", cell_index) 
