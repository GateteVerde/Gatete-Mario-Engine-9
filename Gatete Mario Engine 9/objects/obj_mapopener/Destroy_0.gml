/// @description Make Mario able to move

//If the game allows you to save
if (obj_mapmario.savegame == true)
	with (obj_mapmario) alarm[1] = 64;

//Otherwise, allow movement
else {

	with (obj_mapmario) alarm[10] = 64;
	with (obj_mapcontrol) alarm[0] = 64;
}