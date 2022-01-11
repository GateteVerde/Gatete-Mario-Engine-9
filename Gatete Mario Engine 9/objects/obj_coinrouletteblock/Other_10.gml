/// @description Sprout coins based on frame

//Play 'Big Coin' sound
audio_play_sound(snd_coin_big, 0, false);

//Create coins based on frame
switch (image_index) {

	//5 Coins
	case (0):
	case (3):
	case (6): {
	
		//Repeat 5 times
		repeat (5) {
			
			with (instance_create_depth(x + 8, ystart - 28, -4, obj_coinnpc)) {
			
				xspeed = (place_meeting(x, y, obj_swim)) ? random_range(-1, 1) : random_range(-2, 2);
				yspeed = (place_meeting(x, y, obj_swim)) ? random_range(-1, -3) : random_range(-2, -6);
			}
		}
	} break;
	
	//10 Coins
	case (1):
	case (4):
	case (7): {
	
		with (instance_create_depth(x + 8, ystart - 28, -4, obj_coin_10)) {
		
			ready = 1;
			xspeed = (place_meeting(x, y, obj_swim)) ? random_range(-1, 1) : random_range(-2, 2);
			yspeed = (place_meeting(x, y, obj_swim)) ? random_range(-1, -3) : random_range(-2, -6);
		}
	} break;
	
	//30 Coins
	case (2):
	case (5):
	case (8): {
		
		//Repeat 3 times
		repeat (3) {
	
			with (instance_create_depth(x + 8, ystart - 28, -4, obj_coin_10)) {
		
				ready = 1;
				xspeed = (place_meeting(x, y, obj_swim)) ? random_range(-1, 1) : random_range(-2, 2);
				yspeed = (place_meeting(x, y, obj_swim)) ? random_range(-1, -3) : random_range(-2, -6);
			}
		}
	} break;
	
	//50 Coins
	default: {
	
		//Repeat 3 times
		repeat (5) {
	
			with (instance_create_depth(x + 8, ystart - 28, -4, obj_coin_10)) {
		
				ready = 1;
				xspeed = (place_meeting(x, y, obj_swim)) ? random_range(-1, 1) : random_range(-2, 2);
				yspeed = (place_meeting(x, y, obj_swim)) ? random_range(-1, -3) : random_range(-2, -6);
			}
		}
	} break;
}