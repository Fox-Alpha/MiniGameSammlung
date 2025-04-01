# Netzwerkverwaltung 
extends Node 
 
var peer: ENetMultiplayerPeer = null 
var player_id: int = 0 
var opponent_id: int = 0 
 
func create_server(port: int) -> int: 
	peer = ENetMultiplayerPeer.new() 
	var error: int = peer.create_server(port, 1) # Nur ein Client erlaubt 
	if error != OK: 
		return error 
	multiplayer.multiplayer_peer = peer 
	player_id = 1 # Host ist Spieler 1 (X) 
	return OK 
