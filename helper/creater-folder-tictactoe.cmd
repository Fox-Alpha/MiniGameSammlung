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

echo Alle Ordner und Dateien wurden erstellt!
echo .gitkeep Dateien wurden in alle Ordner hinzugefügt, um sie in Git zu behalten.
pause
