# Leichte KI 
extends "ai_player.gd" 
 
func get_move(board: Array, player: int) -> int: 
	# Einfache KI: hauptsächlich zufällige Züge 
	var empty_cells: Array[int] = [] 
	for i in range(board.size()): 
		if board[i] == 0: 
			empty_cells.append(i) 
	if empty_cells.size() 
		return empty_cells[randi() % empty_cells.size()] 
	return -1 # Kein gültiger Zug 
