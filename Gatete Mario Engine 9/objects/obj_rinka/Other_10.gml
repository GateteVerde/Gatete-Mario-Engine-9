/// @description Turn into a poof of smoke

//Play 'Rinka' sound
audio_play_sound(snd_rinka, 0, false);

//Create death effect
with (instance_create_depth(x, y, -6, obj_smoke)) sprite_index = spr_rinka_dead;

//Destroy
instance_destroy();