/// @description Begin timer

//Increment hits
hits++;

//If the scatter mode is not active
if (scatter == 0) {
	
	//If this block has been bumped from above
	if (bottom == true) {
		
		//Play 'Big Coin' sound
		audio_play_sound(snd_coin_big, 0, false);

		//Repeat as many coins you want to spawn
		repeat (10) {

			with (instance_create_depth(x + 8, ystart + 16, -4, obj_coinnpc)) {
	
				xspeed = (place_meeting(x, y, obj_swim)) ? random_range(-0.5, 0.5) : random_range(-1, 1);
				yspeed = (place_meeting(x, y, obj_swim)) ? 2 : 4;
			}
		}
		
		//Do not repeat this event
		coiny = 2;
	}
	
	//Otherwise
	else {

		//Begin timer
		if (coiny == 0) {

			coiny = 1;
			alarm[2] = 240;
		}

		//Create 5 coins if this block was hit 10 or more times
		else if (coiny == 2) {

			if (hits >= 10) 
			&& (mushroom == false) {
	
				//Play 'Big Coin' sound
				audio_play_sound(snd_coin_big, 0, false);

				//Repeat as many coins you want to spawn
				repeat (5) {

					with (instance_create_depth(x + 8, ystart - 16, -4, obj_coinnpc)) {
	
						xspeed = (place_meeting(x, y, obj_swim)) ? random_range(-0.5, 0.5) : random_range(-1, 1);
						yspeed = (place_meeting(x, y, obj_swim)) ? random_range(-1, -3) : random_range(-2, -6);
					}
				}
			}
		}

		//Create coin
		instance_create_depth(x + 8, ystart - 16, -4, obj_block_coin);
	}
}

//Otherwise, if the scatter mode is active
else if (scatter == true) {

	//Play 'Big Coin' sound
	audio_play_sound(snd_coin_big, 0, false);
	
	//If the block has been bumped from above
	if (bottom == false) {

		//Repeat as many coins you want to spawn
		repeat (coins) {

			with (instance_create_depth(x + 8, ystart - 16, -4, obj_coinnpc)) {
	
				xspeed = (place_meeting(x, y, obj_swim)) ? random_range(-0.5, 0.5) : random_range(-1, 1);
				yspeed = (place_meeting(x, y, obj_swim)) ? random_range(-1, -3) : random_range(-2, -6);
			}
		}
	}
	
	//Otherwise
	else {
		
		//Repeat as many coins you want to spawn
		repeat (coins) {

			with (instance_create_depth(x + 8, ystart + 16, -4, obj_coinnpc)) {
	
				xspeed = (place_meeting(x, y, obj_swim)) ? random_range(-0.5, 0.5) : random_range(-1, 1);
				yspeed = (place_meeting(x, y, obj_swim)) ? 2 : 4;
			}
		}		
	}
}