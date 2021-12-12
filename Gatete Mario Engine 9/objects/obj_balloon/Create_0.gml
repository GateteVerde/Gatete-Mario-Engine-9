/// @description A magic balloon

//Play 'Beanstalk' sound
audio_play_sound(snd_beanstalk, 0, false);

//Set depth
depth = -2;

//Timer
time = 0;

//Set motion
vspeed = -0.75;
if (!instance_exists(obj_mario))
|| (obj_mario.x < x)
	hspeed = 0.5;
else
	hspeed = -0.5;