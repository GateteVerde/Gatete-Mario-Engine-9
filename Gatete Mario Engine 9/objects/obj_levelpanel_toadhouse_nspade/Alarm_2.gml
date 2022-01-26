/// @description Animate and set beat animation

//Play 'Transform' sound
audio_play_sound(snd_transform, 0, false);

//Set frame
image_index = 1;

//Create a smoke effect
with (instance_create_depth(x + 8, y + 8, -4, obj_smoke)) {

	image_xscale = 1.5;
	image_yscale = 1.5;
}
	
//Mark as beaten
beaten = 2;

//End clear sequence
global.clear = 0;
    
//Make Mario able to move again
with (obj_mapmario) alarm[1] = 64;