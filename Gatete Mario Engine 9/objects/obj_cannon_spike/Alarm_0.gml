/// @description Shoot cannonball

//If Mario does not exist
if (!instance_exists(obj_mario))
|| ((instance_exists(obj_mario)) && (instance_exists(obj_mario_transform))) {

    alarm[0] = 1;
    exit;
}

//Play 'Thud' sound
audio_play_sound(snd_thud, 0, false);

#region PARTICLES

	repeat (16) {
		
		with (instance_create_depth(xstart, ystart, 150, obj_smoke)) {
	
			motion_set(random_range(80,100), random(6));
			friction = 0.05;
		}
	}
#endregion

#region CANNONBALL

	with (instance_create_depth(x, y, 150, obj_cannonball_spike)) {
	
		//Set motion
		xspeed = random_range(1, -1);
		yspeed = random_range(-3, -6)
	}
#endregion

//Shoot again
alarm[0] = 200;