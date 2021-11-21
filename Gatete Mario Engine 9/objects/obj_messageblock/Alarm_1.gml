/// @description Finish block bump

//Play 'Message' sound
audio_play_sound(snd_message, 0, false);

//Stop moving
speed = 0;

//Snap in start position
x = xstart;
y = ystart;

//Create the message
with (instance_create_layer(0, 0, "GUI", obj_message)) {

	varmsg = other.varmsg;
	mute_sound = true;
}

//Delay block bump
alarm[2] = 24;