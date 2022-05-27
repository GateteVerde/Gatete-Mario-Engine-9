/// @description Destroy

//Play 'Kick' sound
audio_play_sound(snd_kick, 0, 0);

//Get 100 points
with (instance_create_depth(x, y, -6, obj_score)) value = 100;

//Create smoke effect
with (instance_create_depth(x, y, -6, obj_smoke)) sprite_index = spr_smoke_b;

//Destroy
instance_destroy();
