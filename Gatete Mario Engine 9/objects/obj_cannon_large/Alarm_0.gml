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

//Create cannon ball
with (instance_create_depth(x ,y , -2, obj_bulletbill)) {

	//Set the sprite
	sprite_index = spr_cannonball_large;
    
	//Motion
	if (other.direct = 1)
		xspeed = 3;
	else if (other.direct == -1)
		xspeed = -3;
}

//Create smoke effect
with (instance_create_depth(x, y, -6, obj_smoke)) {

	image_xscale = 2;
	image_yscale = 2;
}

//Repeat after 3 seconds
alarm[0] = 180;