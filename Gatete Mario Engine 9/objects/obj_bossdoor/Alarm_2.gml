/// @description Finish boss door animation

//Play 'Destroy' sound
audio_play_sound(snd_destroy, 0, false);

//Set frame
image_index = 3;

//Create smoke
instance_create_depth(x+8, y+56, -6, obj_smoke);

//With the level controller
with (obj_levelcontrol) {

	//Set boss music
	inisection = "Boss";
	
	//Stop music
	alarm[1] = 1;
	
	//Play it again
	alarm[0] = 2;
}

//Unfreeze Mario
with (obj_mario) enable_control = true;

//Begin boss battle
with (obj_bossparent) alarm[10] = 1;