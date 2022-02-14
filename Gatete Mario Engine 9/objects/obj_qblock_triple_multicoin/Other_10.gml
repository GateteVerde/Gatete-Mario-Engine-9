/// @description Begin timer

//If this block has been hit from below
if (bottom == false) {

	//Increment hits
	hits++;

	//Begin timer
	if (coiny == 0) {

		coiny = 1;
		alarm[2] = 240;
	}

	//Create 2 coins
	for (var i=0; i<3; i++)
		instance_create_depth(x + 8 + (i * 16), ystart - 16, -4, obj_block_coin);
}

//Otherwise, scatter them
else if (bottom == true) {

	//Play 'Big Coin' sound
	audio_play_sound(snd_coin_big, 0, false);
	
	//Repeat as many coins you want to spawn
	repeat (10) {
		
		//Create 3 coins
		for (var i=0; i<3; i++) {

			with (instance_create_depth(x + 8 + (i * 16), ystart + 16, -4, obj_coinnpc)) {
	
				xspeed = (place_meeting(x, y, obj_swim)) ? random_range(-0.5, 0.5) : random_range(-1, 1);
				yspeed = (place_meeting(x, y, obj_swim)) ? 2 : 4;
			}
		}
	}
		
	//Do not repeat this event
	coiny = 2;
}