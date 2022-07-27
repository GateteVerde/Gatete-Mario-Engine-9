/// @description Reznor Death event

//Inherit the parent event
event_inherited();

//If the number of reznors is equal to 0, stop music
if (instance_number(obj_reznor_enemy) == 0) {

	//Play 'Magic' sound
	audio_play_sound(snd_magic, 0, false);
	
	//With the level control
	with (obj_levelcontrol) {
	
		alarm[1] = 1;
		alarm[2] = 0;
	}
	
	//With the wheel
	with (obj_bossorb) alarm[0] = 60;
	
	//With the bridge
	with (obj_reznor_ground) event_user(0);
}