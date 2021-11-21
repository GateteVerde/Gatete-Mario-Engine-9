/// @description Penguin Suit logic

//Inherit the parent event
event_inherited();

//If there's no gravity
if (yadd == 0) {
	
	//If this item is meant to move after landing, move it
	if (move_after_landing == 1) {

		//Deny this event
		move_after_landing = 0;
	
		//Set the vertical speed
		yspeed = -(1 - (swimming * 0.5));
		y--;
	
		//Set the horizontal speed
		if (!instance_exists(obj_mario))
		|| (obj_mario.x < x)
			xspeed = -0.25 + (swimming * 0.125);
		else
			xspeed = 0.25 - (swimming * 0.125);
	}
	
	//Otherwise, if the item can bounce
	else if (can_bounce == true) {
	
		//Set the vertical speed
		yspeed = -(1 - (swimming * 0.5));
		y--;
	}
	
	//Set the frame
	if (image_index != 2)
		image_index = 2;
	else
		image_index = 1;
}