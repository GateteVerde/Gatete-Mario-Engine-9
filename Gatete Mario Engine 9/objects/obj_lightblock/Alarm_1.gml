/// @description Finish block bump

//Play 'Switch' sound
audio_play_sound(snd_switch, 0, false);

//Change disco light state
if (instance_exists(obj_light_disco)) {

	with (obj_light_disco) event_user(0);
}

//Stop moving
speed = 0;

//Snap in start position
x = xstart;
y = ystart;

//Allow block to be bumped again
ready = 0;