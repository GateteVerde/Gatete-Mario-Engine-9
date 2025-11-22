/// @description Destroy POW Block

//Play 'Thud' sound
audio_play_sound(snd_thud, 0, false);

//Shake the screen
shake_camera(6, ceil(audio_sound_length(snd_thud) * GAME_SPEED), true);

//Create used POW
instance_create_layer(x, y, "Main", obj_powblock_used);

//Create POW instance
instance_create_layer(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 2, "Main", obj_powblock_killer);

//Destroy
instance_destroy();