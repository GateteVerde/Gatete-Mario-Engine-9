/// @description 1-UP Balloon

//Set motion
if (x < room_width/2) {

	//Move to the right
	hspeed = 1;
	
	//Increase and turn into a 2-UP balloon
	if (floor(random(100)) > 50) {
	
		//Turn into a 2-UP balloon
		sprite_index = spr_1upgame_2up;
		hspeed += 1;
		depth--;
		
		//Increase and turn into a 3-UP balloon
		if (floor(random(100)) > 50) {
		
			sprite_index = spr_1upgame_3up;
			hspeed += 2;
			depth--;
		}	
	}
}

//Otherwise, if the balloon comes from the left
else if (x > room_width/2) {

	//Move to the left
	hspeed = -1;
	
	//Increase and turn into a 2-UP balloon
	if (floor(random(100)) > 50) {
	
		//Turn into a 2-UP balloon
		sprite_index = spr_1upgame_2up;
		hspeed -= 1;
		depth--;
		
		//Increase and turn into a 3-UP balloon
		if (floor(random(100)) > 50) {
		
			sprite_index = spr_1upgame_3up;
			hspeed -= 2;
			depth--;
		}	
	}
}