# Spielbrett-Skript 
extends Node2D 
 
var cells: Array = [] # Referenzen auf die 9 Zellen 
 
func _ready() -> void: 
	# Zellen initialisieren und verbinden 
	for i in range(9): 
		cells.append(get_node("Cell" + str(i))) 
		cells[i].connect("cell_pressed", Callable(self, "_on_cell_pressed")) 
		cells[i].cell_index = i 
