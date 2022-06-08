/// @description Shoot a cannonball

//If Mario does not exist
if (!instance_exists(obj_mario))
|| ((instance_exists(obj_mario)) && (instance_exists(obj_mario_transform)))
|| (obj_levelcontrol.gswitch_on == true) {

    alarm[0] = 1;
    exit;
}

//Play 'Thud' sound
audio_play_sound(snd_thud, 0, false);

//Check in what direction is the cannon pointing
switch (direct) {
	
	//Left
	case (-1): {
		
		//Create smoke effect
		instance_create_depth(x, y, -6, obj_smoke);

		//Create cannon ball
		with (instance_create_depth(x, y, -2, obj_bobomb_cannon)) {

			//Set horizontal speed
			xspeed = -1;
			
			//Set vertical speed
			yspeed = -3.5;
			y--;
		}
	} break;
	
	//Default (Right)
	default: {
		
		//Create smoke effect
		instance_create_depth(x+16, y, -6, obj_smoke);
	
		//Create cannon ball
		with (instance_create_depth(x+16, y, -2, obj_bobomb_cannon)) {

			//Set horizontal speed
			xspeed = 1;
			
			//Set vertical speed
			yspeed = -3.5;
			y--;
		}
	} break;
}

//Repeat after 3 seconds
alarm[0] = 180;
