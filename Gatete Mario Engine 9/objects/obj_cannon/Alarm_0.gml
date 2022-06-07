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
with (instance_create_depth(x+8+lengthdir_x(8, direct),y+8+lengthdir_y(8, direct), -2, obj_bulletbill)) {

	//Set the sprite
	sprite_index = spr_cannonball;
    
	//Motion
	#region
	
		if (other.direct == 0)
			xspeed = 1.5;
		else if (other.direct == 45) {
		
			xspeed = 1.5;
			yspeed = -1.5;
		}
		else if (other.direct == 90)
			yspeed = -1.5;
		else if (other.direct == 135) {
		
			xspeed = -1.5;
			yspeed = -1.5;
		}
		else if (other.direct == 180)
			xspeed = -1.5;
		else if (other.direct = 225) {
		
			xspeed = -1.5;
			yspeed = 1.5;
		}
		else if (other.direct = 270)
			yspeed = 1.5;
		else if (other.direct == 315) {
			
			xspeed = 1.5;
			yspeed = 1.5;
		}
	#endregion
}

//Create smoke effect
instance_create_depth(x+8+lengthdir_x(8, direct), y+8+lengthdir_y(8, direct), -6, obj_smoke);

//Repeat after 3 seconds
alarm[0] = 180;
