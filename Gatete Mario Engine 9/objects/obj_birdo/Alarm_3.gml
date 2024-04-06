/// @description Shoot an egg and resume movement

//Play 'Spit' sound
audio_play_sound(snd_yoshi_spit, 0, false);

//If this is not a pink birdo
if (type == 0) {
	
	//Resume movement
	alarm[4] = 30;

	//Shoot a egg
	with (instance_create_depth(x + 8 * sign(xscale), y - 12, -4, obj_birdo_egg))
		xspeed = 2 * sign(other.xscale);
}

//Otherwise
else {
			
	//Set default sprite
	sprite_index = spr_birdo;
		
	//If this is a red birdo
	if (type == 1) {
			
		//With a random chance
		if (irandom(100) > 50) {
			
			//Shoot a egg
			with (instance_create_depth(x + 8 * sign(xscale), y - 12, -4, obj_birdo_egg))
				xspeed = 2 * sign(other.xscale);
		}
		else {
			
			//Shoot a fire
			with (instance_create_depth(x + 8 * sign(xscale), y - 12, -4, obj_birdo_fire))
				xspeed = 2 * sign(other.xscale);
		}
	}
		
	//Otherwise
	else if (type == 2) {
		
		//Shoot a fire
		with (instance_create_depth(x + 8 * sign(xscale), y - 12, -4, obj_birdo_fire))
			xspeed = 2 * sign(other.xscale);
	}
		
	//Decrement fires
	fires--;
		
	//Shoot again if allowed
	if (fires > 0)			
		alarm[2] = 30;
	else {
		
		fires = 3;
		alarm[4] = 30;
	}
}