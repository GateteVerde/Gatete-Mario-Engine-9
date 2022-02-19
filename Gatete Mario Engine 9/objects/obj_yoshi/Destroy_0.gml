/// @description Destroy Yoshi

//Stop 'Flying' sound
audio_stop_sound(snd_yoshi_lick);

//Stop 'Flutter' sound
audio_stop_sound(snd_yoshi_hover);

//Destroy Yoshi's tongue if it exists
with (obj_yoshi_tongue) instance_destroy();

//If the keyhole has been activated
if ((instance_exists(obj_keyhole)) && (obj_keyhole.ready == 0)) {
	
	//Dismount yoshi
	global.mount = 0;

	//Make both the player and yoshi do stuff
	if (instance_exists(obj_mario)) {

	    obj_mario.holding = 0;
	    obj_mario.visible = 1;
	    if (mouthholder != noone)
	        event_user(0);
	}
}