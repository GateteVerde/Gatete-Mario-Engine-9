/// @description Make Mario run in the wall

//Should not have these powerups
if (global.powerup == cs_tiny)
|| (global.powerup == cs_frog)
|| (global.powerup == cs_bell)
|| (global.powerup == cs_mega)
exit;

//If Mario is riding a Yoshi
if (global.mount == 1) {
	
	//Play 'Trampoline' sound
	audio_play_sound(snd_trampoline, 0, false);

	//Make Mario jump
	with (obj_mario) {
			
		event_user(1);
		state = playerstate.jump;
	}
}

//Otherwise, if Mario is not riding a Yoshi
else if (global.mount == 0) {
		
	//If the player meets these conditions
    if (other.state < playerstate.jump)
    && (other.crouch == 0)
    && (other.holding == 0)
	&& (other.swimming == false)
    && (!instance_exists(obj_mario_wallrunner)) {
			
		//If Mario is running right and there is a solid wall there, wall run up
		if (other.xspeed > 2.5)
		&& (position_meeting(x+24, y-8, obj_solid))
		    instance_create_depth(x, y-32, -5, obj_mario_wallrunner);

		//Otherwise, if Mario is running left and there is a downward wall there and no floor, run down
		else if (other.xspeed < -2.5)
		&& (position_meeting(x+8, y+24, obj_solid))
		&& (!position_meeting(x-8, y+24, obj_semisolid)) {
				
		    with (instance_create_depth(x-16, y+16, -5, obj_mario_wallrunner)) {
					
		        direct = -1;
		        direction = 270;
		    }
		}
    }
}