/// @description Destroy

//Play 'Bump' sound
audio_play_sound(snd_bump, 0, false);

//Create new trampoline
with (instance_create_layer(xstart, ystart, "Main", obj_trampoline_timed)) time = other.time;

//Create smoke
instance_create_depth(x, y+8,  -6, obj_smoke);

//Destroy
instance_destroy();