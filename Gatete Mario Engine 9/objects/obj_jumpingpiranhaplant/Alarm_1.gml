/// @description Spit fireballs

//Play 'Podoboo' sound
audio_play_sound(snd_burn, 0, false);

//Create fireballs
with (instance_create_depth(x, y+4, -2, obj_plantfire2)) {

    xspeed = 1;
	yspeed = -3;
}
with (instance_create_depth(x, y+4, -2, obj_plantfire2)) {

    xspeed = -1;
	yspeed = -3;
}
