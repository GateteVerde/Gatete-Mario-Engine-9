/// @description Destroy Yoshi

if (instance_exists(obj_keyhole))
&& (obj_keyhole.ready != 0)
exit;

//Stop 'Flying' sound
audio_stop_sound(snd_yoshi_fly);

//Stop 'Flutter' sound
audio_stop_sound(snd_yoshi_hover);

//Destroy Yoshi's tongue if it exists
with (obj_yoshi_tongue) instance_destroy();

//Dismount yoshi
global.mount = 0;

//Make both the player and yoshi do stuff
if (instance_exists(obj_mario)) {

	obj_mario.holding = 0;
	obj_mario.visible = 1;
	if (mouthholder != noone)
		event_user(0);
}