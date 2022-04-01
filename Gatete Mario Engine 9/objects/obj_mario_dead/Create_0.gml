/// @description Mario has died!

//Do not animate
image_speed = 0;

//Play 'Dead' fanfare
audio_play_sound(snd_dead, 0, false);

//Freeze all physicsparent object
with (obj_physicsparent) event_user(13);

//Stop stream
with (obj_levelcontrol) {

	event_user(0);
	alarm[2] = -1;
}

//Subtract one life
lives--;

//Jump
alarm[0] = 48;

//Restart
alarm[1] = 200;

//Reset mount
global.mount = 0;

//Reset safeguard
global.safeguard = 0;

//Show 'Mario Start' again
global.mariostart = 0;

//Mario died, remove powerup
global.died = 1;