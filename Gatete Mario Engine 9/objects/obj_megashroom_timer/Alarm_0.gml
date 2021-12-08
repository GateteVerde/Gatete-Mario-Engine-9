/// @description End mega shroom

//Stop 'Starman' sound
audio_stop_sound(snd_megashroom);

//Play the music from the level
obj_levelcontrol.alarm[0] = 1;

//Turn Mario invisible
if (instance_exists(obj_mario)) {
	
	//Play 'Warp' sound
	audio_play_sound(snd_warp, 0, false);

	//Make Mario invisible
	obj_mario.visible = false;
	
	//Make Mario vulnerable
	obj_mario.invulnerable = false;
	
	//Create transformation object
	with (instance_create_depth(0, 0, -5, obj_mario_transform)) {
	
		image_xscale = 4;
		sequence = 6;
	}
	
	//Set 'Big' powerup
	global.powerup = cs_big;

	//Destroy
	instance_destroy();
}