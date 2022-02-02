/// @description Pop the balloons and get extra lives

//Play 'Pop' sound
audio_play_sound(snd_pop, 0, false);
	
//1-UP
if (sprite_index == spr_1upgame_1up) {
		
	with (instance_create_depth(x, y, -6, obj_score)) 
		value = -1;
}
		
//2-UP
else if (sprite_index == spr_1upgame_2up) {
		
	with (instance_create_depth(x, y, -6, obj_score)) 
		value = -2;
}
		
//3-UP
else if (sprite_index == spr_1upgame_3up) {
		
	with (instance_create_depth(x, y, -6, obj_score)) 
		value = -3;
}

//Create smoke effect
with (instance_create_depth(x, y, -4, obj_smoke)) sprite_index = spr_pop;

//Destroy
instance_destroy();