/// @description Animate and set beat animation

//Play 'Transform' sound
audio_play_sound(snd_transform, 0, false);

//Create a smoke effect
with (instance_create_depth(x + 8, y + 8, -4, obj_smoke)) {

	image_xscale = 1.5;
	image_yscale = 1.5;
}

//End clear sequence
global.clear = 0;

//Prevent house from appearing
global.star_house[myworld] = 0;
    
//Make Mario able to move again
with (obj_mapmario) alarm[1] = 64;

//Destroy
instance_destroy();