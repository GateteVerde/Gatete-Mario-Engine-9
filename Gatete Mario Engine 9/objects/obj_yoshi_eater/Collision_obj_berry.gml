/// @description Eat berries on contact

//If Yoshi's does meet these conditions, exit
if (obj_yoshi.licking > 0)
|| (obj_yoshi.mouthholder != noone)
	exit;
	
//Play 'Eat' sound
audio_play_sound(snd_yoshi_eat, 0, false);

//Get berry sprite
berry = other.sprite_index;

//Start licking
obj_yoshi.licking = 1;
	
//Lock it
obj_yoshi.locked = 1;
	
//Animation
obj_yoshi.anim = 0;
	
//End licking
obj_yoshi.alarm[2] = 10;
	
//Destroy food
with (other) instance_destroy()