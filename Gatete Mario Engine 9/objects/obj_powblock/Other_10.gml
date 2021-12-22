/// @description Destroy POW Block

//Play 'Thud' sound
audio_play_sound(snd_thud, 0, false);

//Shake the screen
shake_camera(6, ceil(audio_sound_length(snd_thud) * room_speed), true);

//Create used POW
instance_create_layer(x, y, "Main", obj_powblock_used);

//Create POW instance
//instance_create(x, y+8, obj_powblock_killer);

//Destroy
instance_destroy();