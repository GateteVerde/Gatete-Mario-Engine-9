/// @description Create boss orb

//Play 'Chest' sound
audio_play_sound(snd_chest, 0, false);

//Create goal orb
instance_create_depth(x, y, -2, obj_goalorb);

//Create smoke effect
instance_create_depth(x, y+8, -6, obj_smoke);

//Destroy
instance_destroy();