/// @description Fade out or defeat

//If the boo has still health
if (hp > 0)
	ready = 4;
	
//Otherwise
else {

	//Play 'Defeat' sound
	audio_play_sound(snd_defeat, 0, false);
	
	//With the level control
	with (obj_levelcontrol) {
	
		alarm[1] = 1;
		alarm[2] = 0;
	}
	
	//Perform event
	event_user(0);
	
	//With the boos
	with (obj_boo) {
	
		instance_create_depth(x, y+8, -6, obj_smoke);
		instance_destroy();
	}
	
	//With the wheel
	with (obj_bossorb) alarm[0] = 60;
	
	//Get 4000 points
	with (instance_create_depth(x, bbox_top, -7, obj_score))
		value = 4000;
}