# Vorgeschlagene Ordnerstruktur für Godot 4.4 Tic Tac Toe Projekt

```
TicTacToeNetwork/
│
├── .git/                       # Git-Repository (optional)
├── .gitignore                  # Git-Ignore-Datei
│
├── assets/                     # Alle Ressourcen
│   ├── fonts/                  # Schriftarten
│   ├── images/                 # Bilddateien
│   │   ├── ui/                 # UI-Elemente
│   │   ├── backgrounds/        # Hintergrundbilder
│   │   └── icons/              # Symbole und Icons
│   ├── audio/                  # Audio-Dateien
│   │   ├── music/              # Hintergrundmusik
│   │   └── sfx/                # Soundeffekte
│   └── themes/                 # UI-Themes
│
├── scenes/                     # Szenen
│   ├── main_menu/              # Hauptmenü-Szene und Skripte
│   ├── game/                   # Hauptspielszene
│   │   ├── board.tscn          # Spielbrett-Szene
│   │   ├── board.gd            # Spielbrett-Skript
│   │   ├── cell.tscn           # Einzelne Zelle des Spielbretts
│   │   └── cell.gd             # Zellen-Skript
│   ├── lobby/                  # Online-Lobby-Szene
│   │   ├── lobby.tscn          # Lobby-Szene
│   │   └── lobby.gd            # Lobby-Skript
│   └── ui/                     # UI-Komponenten
│       ├── settings_menu.tscn  # Einstellungsmenü
│       └── game_over.tscn      # Spielende-Bildschirm
│
├── scripts/                    # Globale Skripte
│   ├── globals.gd              # Globale Variablen und Funktionen
│   ├── game_state.gd           # Spielzustandsverwaltung
│   ├── network_manager.gd      # Netzwerkverwaltung
│   └── ai/                     # KI-Skripte
│       ├── ai_player.gd        # Basis-KI-Klasse
│       ├── easy_ai.gd          # Leichte KI
│       ├── medium_ai.gd        # Mittlere KI
│       └── hard_ai.gd          # Schwere KI (Minimax)
│
├── addons/                     # Godot-Plugins (falls benötigt)
│
├── tests/                      # Testdateien (optional)
│   ├── unit/                   # Unit-Tests
│   └── integration/            # Integrationstests
│
├── export_presets.cfg          # Exporteinstellungen
├── project.godot               # Godot-Projektdatei
└── README.md                   # Projekt-Dokumentation
```
