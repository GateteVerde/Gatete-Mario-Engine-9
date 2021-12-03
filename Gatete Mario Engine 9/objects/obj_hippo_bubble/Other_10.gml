/// @description Pop the bubble

//Play 'Pop' sound
audio_play_sound(snd_pop, 0, false);

//Create 'Pop' effect
with (instance_create_depth(x, y, -6, obj_smoke)) sprite_index = spr_pop;
	
//Destroy
instance_destroy();