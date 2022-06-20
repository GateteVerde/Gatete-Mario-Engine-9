/// @description Close the game

//Do not allow exit if you are in the title screen
if (room == rm_title)
exit;
	game_end();