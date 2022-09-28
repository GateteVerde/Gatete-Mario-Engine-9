/// @description Collision with semisolid

//Play 'Bump' sound
audio_play_sound(snd_bump, 0, false);

//Destroy laser
instance_create_depth(x, y+8, -6, obj_smoke);
instance_destroy();
exit;