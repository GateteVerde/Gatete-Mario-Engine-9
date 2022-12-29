/// @description Turn into debris

//Play 'Crumble' sound
audio_play_sound(snd_crumble, 0, false);

//Create debris
with (instance_create_depth(x, y, -6, obj_drypiranha_debris)) image_index = 0;
with (instance_create_depth(x, y + 12, -6, obj_drypiranha_debris)) image_index = 1;

//Destroy
instance_destroy();