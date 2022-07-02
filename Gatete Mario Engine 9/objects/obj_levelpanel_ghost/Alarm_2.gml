/// @description Animate and set beat animation

//If the level has not been beaten before
if (beaten == 0) {

	//Play 'Transform' sound
	audio_play_sound(snd_transform, 0, false);
	
	//Create a smoke effect
	instance_create_depth(myboo.x, myboo.y, -4, obj_smoke);
	
	//Destroy map boo
	with (myboo) instance_destroy();
	
	//Mark as beaten
	beaten = 1;
}