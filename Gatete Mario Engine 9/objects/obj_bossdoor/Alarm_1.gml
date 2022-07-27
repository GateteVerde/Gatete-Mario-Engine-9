/// @description Boss Door Animation 3

//Play 'Destroy' sound
audio_play_sound(snd_destroy, 0, false);

//Set frame
image_index = 2;

//Create smoke
instance_create_depth(x+8, y + 40, -6, obj_smoke);

//Follow animation
alarm[2] = 20;