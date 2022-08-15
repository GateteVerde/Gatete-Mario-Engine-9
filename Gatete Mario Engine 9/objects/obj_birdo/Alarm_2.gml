/// @description Move again

//Play 'Spit' sound
audio_play_sound(snd_yoshi_spit, 0, false);

//Resume movement
alarm[3] = 30;

//Shoot a egg
with (instance_create_depth(x + 8 * sign(xscale), y - 12, -4, obj_birdo_egg))
	xspeed = 1.5 * sign(other.xscale);