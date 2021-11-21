/// @description Mario has died!

//Do not animate
image_speed = 0;

//Play 'Dead' fanfare
audio_play_sound(snd_dead, 0, false);

//Stop stream
with (obj_levelcontrol) {

	event_user(0);
	alarm[2] = -1;
}

//Subtract one life
lives--;

//Jump
alarm[0] = 60;

//Restart
alarm[1] = 200;

//Reset mount
global.mount = 0;

//Reset powerup
global.powerup = cs_small;

//Show 'Mario Start' again
global.mariostart = 0;