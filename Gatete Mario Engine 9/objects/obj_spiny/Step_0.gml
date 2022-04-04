/// @description Spiny logic

//Inherit the parent event
event_inherited();

//If this object is not a ceiling spiny
if (object_index != obj_spiny_ceiling) {

	//Check for a nearby swimming surface
	var water = collision_line(bbox_left, y+8, bbox_right, y+8, obj_swim, 0, 0);

	//If the spiny is in contact with water
	if (water) {
	
		//Set the egg sprite
		sprite_index = spr_spiny_egg;
	
		//Stop horizontal speed
		xspeed = 0;
	
		//Set the vertical speed
		yspeed -= 0.2;
		if (yspeed < -2)
			yspeed = -2;
	}

	//If not longer in contact with water
	else if (!water) {
	
		//If there's no gravity
		if (yadd == 0) 
		&& (sprite_index == spr_spiny_egg) {
	
			//Set the regular sprite
			sprite_index = spr_spiny;
		
			//Hop a bit
			yspeed = -2;
			y--;
		
			//If not moving
			if (xspeed == 0)
				xspeed = 0.5 * sign(xscale);
		}
	}
}
