/// @description Yellow Yoshi / Dossun Shoe stomp mask

//Inherit the parent event
event_inherited();

//Play 'Thud' sound
audio_play_sound(snd_stomp2, 0, false);
	
//Create smoke effect
with (instance_create_depth(x, y, -6, obj_smoke)) sprite_index = spr_supersmash;
with (instance_create_depth(x, y, -6, obj_smoke)) {
	
	sprite_index = spr_supersmash;
	image_xscale = -1;
}