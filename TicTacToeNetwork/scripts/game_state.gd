# Spielzustandsverwaltung 
extends Node 
 
var current_player: int = 1 # Spieler 1 beginnt (X) 
var board: Array[int] = [0, 0, 0, 0, 0, 0, 0, 0, 0] # Leeres 3x3 Spielfeld 
var game_mode: int = 0 # Lokales Spiel standardmäßig 
var game_active: bool = false 
 
func reset_game() -> void: 
	board = [0, 0, 0, 0, 0, 0, 0, 0, 0] 
	current_player = 1 
	game_active = true 
