/// @description Boss Door Animation 2

//Play 'Destroy' sound
audio_play_sound(snd_destroy, 0, false);

//Set frame
image_index = 1;

//Create smoke
instance_create_depth(x+8, y+24, -6, obj_smoke);

//Follow animation
alarm[1] = 20;