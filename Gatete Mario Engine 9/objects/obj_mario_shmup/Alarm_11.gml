/// @description Display tutorial message

//Play 'Message' sound
audio_play_sound(snd_message, 0, false);

//Create the message
with (instance_create_layer(0, 0, "GUI", obj_message)) {

	varmsg = "You are in a shmup stage\n\nUse the Arrow keys to move the vehicle and use '" + string_upper(key_to_string(global.key[input.action_1])) + "' to shoot projectiles to make your way through the stage.\nPowerups cannot be carried through these stages and you can't hold items in reserve."
	mute_sound = true;
}