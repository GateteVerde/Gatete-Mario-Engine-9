/// @description Mario has died!

//Checks if the time has run out
timeup = 0;

//Do not animate
image_speed = 0;

//Play 'Dead / Time Up' fanfare
alarm[3] = 1;

//Freeze all physicsparent object
with (obj_physicsparent) event_user(13);
with (obj_platformparent) event_user(13);

#region SPRITE SET

	//If health mode is active, 
	if (global.hp_mode == true) {
		
		//If Mario has the tiny mushroom powerup
		if (global.powerup == cs_tiny)
			sprite_index = global.death_tiny_sprite;
		else
			sprite_index = global.death_big_sprite;
	}
	
	//Otherwise
	else {
	
		//If Mario has the tiny mushroom powerup
		if (global.powerup == cs_tiny)
			sprite_index = global.death_tiny_sprite;
		else
			sprite_index = global.death_sprite;
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