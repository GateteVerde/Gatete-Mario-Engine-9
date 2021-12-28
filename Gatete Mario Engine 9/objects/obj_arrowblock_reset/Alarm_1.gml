/// @description Finish block bump

//Play 'Switch' sound
audio_play_sound(snd_switch, 0, false);

//Reset position of all arrow blocks
with (obj_arrowblock) {
	
	//Create a puff of smoke
	instance_create_depth(xstart + 8, ystart + 8, -4, obj_smoke);

	//Move to the start position
	x = xstart;
	y = ystart;
	
	//Move solid mask to the start position
	mysolid.x = xstart;
	mysolid.y = ystart;
}

//Stop moving
speed = 0;

//Snap in start position
x = xstart;
y = ystart;

//Allow block to be bumped again
ready = 0;