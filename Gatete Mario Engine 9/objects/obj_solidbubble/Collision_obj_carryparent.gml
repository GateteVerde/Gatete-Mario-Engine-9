/// @description Shrink if hit with a vegetable

//If the item can be hit and the vegetable has been thrown
if (canbehit == true)
&& (other.held == false) {
	
	//If the other object is a mushroom block
	if (other.object_index == obj_mblock_up) {
	
		with (other) {
		
			xspeed *= -1.5;
			yspeed = -4;
		}
		exit;
	}
	
	//Make the vegetable bounce
	other.yspeed = -4;
	
	//If the bubble has been hit less than two times
	if (ready2 != 2) {
	
		//Play 'Bumper' sound
		audio_play_sound(snd_bumper, 0, false);
		
		//Create spin thump
		with (instance_create_depth(other.x, other.y+8, -6, obj_smoke)) sprite_index = spr_spinthump;
		
		//If this bubble has not been hit yet
		if (ready2 == 0) {
		
			//Flag it
			ready2 = 1;
			
			//Disallow hit and allow it after a while
			canbehit = false;
			alarm[1] = 64;
		}
		
		//Otherwise, if this bubble has been hit at least once
		else if (ready2 == 1) {
		
			//Flag it
			ready2 = 2;
			
			//Disallow hit and allow it after a while
			canbehit = false;
			alarm[1] = 64;
		}
	}
	
	//Otherwise, if this bubble has been hit at least two times
	else if (ready2 == 2) {
		
		//Flag it
		ready2 = 3;
	
		//Play 'Magic' sound
		audio_play_sound(snd_magic, 0, false);
		
		//Create smoke effect
		instance_create_depth(x, y-8, -6, obj_smoke);
		
		//Release item
		alarm[2] = 2;
	}
}