@echo off
echo Erstelle Ordnerstruktur für TicTacToeNetwork Godot-Projekt...

:: Hauptverzeichnis erstellen
mkdir TicTacToeNetwork
cd TicTacToeNetwork

:: .gitignore erstellen
echo /addons/ > .gitignore
echo .import/ >> .gitignore
echo export_presets.cfg >> .gitignore
echo .godot/ >> .gitignore
echo *.import >> .gitignore
echo *.translation >> .gitignore
echo # .gitkeep Dateien beibehalten >> .gitignore
echo !.gitkeep >> .gitignore

:: README.md erstellen
echo # TicTacToeNetwork > README.md
echo Ein netzwerkfähiges Tic Tac Toe Spiel entwickelt mit Godot 4.4 >> README.md
echo. >> README.md
echo ## Beschreibung >> README.md
echo Dieses Projekt implementiert ein klassisches Tic Tac Toe Spiel mit Netzwerkfunktionalität, >> README.md
echo lokalem Mehrspielermodus und KI-Gegnern verschiedener Schwierigkeitsgrade. >> README.md

:: Asset-Ordner erstellen und .gitkeep hinzufügen
mkdir assets
echo. > assets\.gitkeep

mkdir assets\fonts
echo. > assets\fonts\.gitkeep

mkdir assets\images
echo. > assets\images\.gitkeep

mkdir assets\images\ui
echo. > assets\images\ui\.gitkeep

mkdir assets\images\backgrounds
echo. > assets\images\backgrounds\.gitkeep

mkdir assets\images\icons
echo. > assets\images\icons\.gitkeep

mkdir assets\audio
echo. > assets\audio\.gitkeep

mkdir assets\audio\music
echo. > assets\audio\music\.gitkeep

mkdir assets\audio\sfx
echo. > assets\audio\sfx\.gitkeep

mkdir assets\themes
echo. > assets\themes\.gitkeep

:: Szenen-Ordner erstellen und .gitkeep hinzufügen
mkdir scenes
echo. > scenes\.gitkeep

mkdir scenes\main_menu
echo. > scenes\main_menu\.gitkeep

mkdir scenes\game
echo. > scenes\game\.gitkeep

mkdir scenes\lobby
echo. > scenes\lobby\.gitkeep

mkdir scenes\ui
echo. > scenes\ui\.gitkeep

:: Skripte-Ordner erstellen und .gitkeep hinzufügen
mkdir scripts
echo. > scripts\.gitkeep

mkdir scripts\ai
echo. > scripts\ai\.gitkeep

mkdir addons
echo. > addons\.gitkeep

mkdir tests
echo. > tests\.gitkeep

mkdir tests\unit
echo. > tests\unit\.gitkeep

mkdir tests\integration
echo. > tests\integration\.gitkeep

:: Leere Basisdateien erstellen
echo # Globale Variablen und Funktionen > scripts\globals.gd
echo extends Node >> scripts\globals.gd
echo. >> scripts\globals.gd
echo # Spielkonstanten >> scripts\globals.gd
echo const PLAYER_X = 1 >> scripts\globals.gd
echo const PLAYER_O = 2 >> scripts\globals.gd
echo const EMPTY = 0 >> scripts\globals.gd
echo. >> scripts\globals.gd
echo # Spielmodi >> scripts\globals.gd
echo const MODE_LOCAL = 0 >> scripts\globals.gd
echo const MODE_AI = 1 >> scripts\globals.gd
echo const MODE_ONLINE = 2 >> scripts\globals.gd

echo # Spielzustandsverwaltung > scripts\game_state.gd
echo extends Node >> scripts\game_state.gd
echo. >> scripts\game_state.gd
echo var current_player = 1 # Spieler 1 beginnt (X) >> scripts\game_state.gd
echo var board = [0, 0, 0, 0, 0, 0, 0, 0, 0] # Leeres 3x3 Spielfeld >> scripts\game_state.gd
echo var game_mode = 0 # Lokales Spiel standardmäßig >> scripts\game_state.gd
echo var game_active = false >> scripts\game_state.gd
echo. >> scripts\game_state.gd
echo func reset_game(): >> scripts\game_state.gd
echo 	board = [0, 0, 0, 0, 0, 0, 0, 0, 0] >> scripts\game_state.gd
echo 	current_player = 1 >> scripts\game_state.gd
echo 	game_active = true >> scripts\game_state.gd

echo # Netzwerkverwaltung > scripts\network_manager.gd
echo extends Node >> scripts\network_manager.gd
echo. >> scripts\network_manager.gd
echo var peer = null >> scripts\network_manager.gd
echo var player_id = 0 >> scripts\network_manager.gd
echo var opponent_id = 0 >> scripts\network_manager.gd
echo. >> scripts\network_manager.gd
echo func create_server(port): >> scripts\network_manager.gd
echo 	peer = ENetMultiplayerPeer.new() >> scripts\network_manager.gd
echo 	var error = peer.create_server(port, 1) # Nur ein Client erlaubt >> scripts\network_manager.gd
echo 	if error != OK: >> scripts\network_manager.gd
echo 		return error >> scripts\network_manager.gd
echo 	multiplayer.multiplayer_peer = peer >> scripts\network_manager.gd
echo 	player_id = 1 # Host ist Spieler 1 (X) >> scripts\network_manager.gd
echo 	return OK >> scripts\network_manager.gd

echo # Basis-KI-Klasse > scripts\ai\ai_player.gd
echo extends Node >> scripts\ai\ai_player.gd
echo. >> scripts\ai\ai_player.gd
echo func get_move(board, player): >> scripts\ai\ai_player.gd
echo 	# Basisimplementierung - wird von den spezifischen KI-Klassen überschrieben >> scripts\ai\ai_player.gd
echo 	return -1 # Kein gültiger Zug >> scripts\ai\ai_player.gd

echo # Leichte KI > scripts\ai\easy_ai.gd
echo extends "ai_player.gd" >> scripts\ai\easy_ai.gd
echo. >> scripts\ai\easy_ai.gd
echo func get_move(board, player): >> scripts\ai\easy_ai.gd
echo 	# Einfache KI: hauptsächlich zufällige Züge >> scripts\ai\easy_ai.gd
echo 	var empty_cells = [] >> scripts\ai\easy_ai.gd
echo 	for i in range(board.size()): >> scripts\ai\easy_ai.gd
echo 		if board[i] == 0: >> scripts\ai\easy_ai.gd
echo 			empty_cells.append(i) >> scripts\ai\easy_ai.gd
echo 	if empty_cells.size() > 0: >> scripts\ai\easy_ai.gd
echo 		return empty_cells[randi() %% empty_cells.size()] >> scripts\ai\easy_ai.gd
echo 	return -1 # Kein gültiger Zug >> scripts\ai\easy_ai.gd

echo # Spielbrett-Skript > scenes\game\board.gd
echo extends Node2D >> scenes\game\board.gd
echo. >> scenes\game\board.gd
echo var cells = [] # Referenzen auf die 9 Zellen >> scenes\game\board.gd
echo. >> scenes\game\board.gd
echo func _ready(): >> scenes\game\board.gd
echo 	# Zellen initialisieren und verbinden >> scenes\game\board.gd
echo 	for i in range(9): >> scenes\game\board.gd
echo 		cells.append(get_node("Cell" + str(i))) >> scenes\game\board.gd
echo 		cells[i].connect("cell_pressed", Callable(self, "_on_cell_pressed")) >> scenes\game\board.gd
echo 		cells[i].cell_index = i >> scenes\game\board.gd

echo # Zellen-Skript > scenes\game\cell.gd
echo extends Area2D >> scenes\game\cell.gd
echo. >> scenes\game\cell.gd
echo signal cell_pressed(index) >> scenes\game\cell.gd
echo. >> scenes\game\cell.gd
echo var cell_index = 0 >> scenes\game\cell.gd
echo var cell_value = 0 # 0: leer, 1: X, 2: O >> scenes\game\cell.gd
echo. >> scenes\game\cell.gd
echo func _on_input_event(_viewport, event, _shape_idx): >> scenes\game\cell.gd
echo 	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT: >> scenes\game\cell.gd
echo 		emit_signal("cell_pressed", cell_index) >> scenes\game\cell.gd

:: Mittlere und schwere KI hinzufügen
echo # Mittlere KI > scripts\ai\medium_ai.gd
echo extends "ai_player.gd" >> scripts\ai\medium_ai.gd
echo. >> scripts\ai\medium_ai.gd
echo func get_move(board, player): >> scripts\ai\medium_ai.gd
echo 	# Prüft zuerst, ob ein Gewinnzug oder ein Block notwendig ist >> scripts\ai\medium_ai.gd
echo 	# Ansonsten zufälligen Zug >> scripts\ai\medium_ai.gd
echo 	pass >> scripts\ai\medium_ai.gd

echo # Schwere KI mit Minimax-Algorithmus > scripts\ai\hard_ai.gd
echo extends "ai_player.gd" >> scripts\ai\hard_ai.gd
echo. >> scripts\ai\hard_ai.gd
echo func get_move(board, player): >> scripts\ai\hard_ai.gd
echo 	# Minimax-Algorithmus für optimale Züge >> scripts\ai\hard_ai.gd
echo 	# Implementierung des Minimax-Algorithmus für optimale Spielstrategie >> scripts\ai\hard_ai.gd
echo 	pass >> scripts\ai\hard_ai.gd

:: Lobby-Skript hinzufügen
echo # Lobby-Skript > scenes\lobby\lobby.gd
echo extends Control >> scenes\lobby\lobby.gd
echo. >> scenes\lobby\lobby.gd
echo func _ready(): >> scenes\lobby\lobby.gd
echo 	# Verbinde UI-Elemente mit entsprechenden Funktionen >> scenes\lobby\lobby.gd
echo 	pass >> scenes\lobby\lobby.gd
echo. >> scenes\lobby\lobby.gd
echo func _on_host_button_pressed(): >> scenes\lobby\lobby.gd
echo 	# Starte einen Server >> scenes\lobby\lobby.gd
echo 	pass >> scenes\lobby\lobby.gd
echo. >> scenes\lobby\lobby.gd
echo func _on_join_button_pressed(): >> scenes\lobby\lobby.gd
echo 	# Trete einem Server bei >> scenes\lobby\lobby.gd
echo 	pass >> scenes\lobby\lobby.gd

:: Hauptmenü-Skript erstellen
echo # Hauptmenü-Skript > scenes\main_menu\main_menu.gd
echo extends Control >> scenes\main_menu\main_menu.gd
echo. >> scenes\main_menu\main_menu.gd
echo func _ready(): >> scenes\main_menu\main_menu.gd
echo 	# Verbinde UI-Elemente mit entsprechenden Funktionen >> scenes\main_menu\main_menu.gd
echo 	pass >> scenes\main_menu\main_menu.gd
echo. >> scenes\main_menu\main_menu.gd
echo func _on_local_game_button_pressed(): >> scenes\main_menu\main_menu.gd
echo 	# Starte lokales Spiel >> scenes\main_menu\main_menu.gd
echo 	pass >> scenes\main_menu\main_menu.gd
echo. >> scenes\main_menu\main_menu.gd
echo func _on_ai_game_button_pressed(): >> scenes\main_menu\main_menu.gd
echo 	# Starte Spiel gegen KI >> scenes\main_menu\main_menu.gd
echo 	pass >> scenes\main_menu\main_menu.gd
echo. >> scenes\main_menu\main_menu.gd
echo func _on_online_game_button_pressed(): >> scenes\main_menu\main_menu.gd
echo 	# Öffne Lobby-Szene >> scenes\main_menu\main_menu.gd
echo 	pass >> scenes\main_menu\main_menu.gd

echo Alle Ordner und Dateien wurden erstellt!
echo .gitkeep Dateien wurden in alle Ordner hinzugefügt, um sie in Git zu behalten.
echo Du kannst nun das Projekt in Godot öffnen und weiterentwickeln.
pause