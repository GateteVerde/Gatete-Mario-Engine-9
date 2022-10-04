/// @description Mario has died!

//Do not animate
image_speed = 0;

//Play 'Dead' fanfare
audio_play_sound(snd_dead, 0, false);

//Freeze all physicsparent object
with (obj_physicsparent) event_user(13);
with (obj_platformparent) event_user(13);

#region SPRITE SET

	//If health mode is active, 
	if (global.hp_mode == true) {
		
		//If Mario has the tiny mushroom powerup
		if (global.powerup == cs_tiny)
			sprite_index = spr_mario_dead_tiny;
		else
			sprite_index = spr_mario_dead_big;
	}
	
	//Otherwise
	else {
	
		//If Mario has the tiny mushroom powerup
		if (global.powerup == cs_tiny)
			sprite_index = spr_mario_dead_tiny;
		else
			sprite_index = spr_mario_dead;
	}
	
#endregion

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

//Set health to zero
global.hp = 0;

//Mario died, remove powerup
global.died = 1;