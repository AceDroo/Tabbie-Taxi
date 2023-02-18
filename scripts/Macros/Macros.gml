gml_pragma("PNGCrush")
gml_pragma("global", "Macros()");

enum GameMode {
	ONE_PLAYER = 1,
	TWO_PLAYER = 2
}

#macro PLAYER_COUNT 2

global.high_score = 0;
global.difficulty = 0;
global.gamemode = GameMode.ONE_PLAYER;