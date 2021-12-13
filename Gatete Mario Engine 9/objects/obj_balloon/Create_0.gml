/// @description A magic balloon

//Inherit event from parent
event_inherited();

//Play 'Beanstalk' sound
audio_play_sound(snd_beanstalk, 0, false);

//Set depth
depth = -2;

//Timer
time = 0;

//Set motion
yspeed = -0.75;
if (!instance_exists(obj_mario))
|| (obj_mario.x < x)
	xspeed = 0.5;
else
	xspeed = -0.5;