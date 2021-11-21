/// @description Collision with a slope

//If the bolt is about to bounce
if (allow_bounce == 1) {

    //If not moving vertically.
    if (yspeed == 0) {
    
        //If moving to the right
        if (xspeed > 0) {
      
			//Move vertically
            xspeed = 0;
            yspeed = -6;
        }
        
        //Otherwise, if moving to the left
        else {

			//Move vertically
            xspeed = 0;
            yspeed = -6;
        }
    }
    else {
        
        //Set the horizontal speed
        xspeed = 6*(1*sign(other.add));
        yspeed = 0;
    }
    
    //Bounce
	alarm[1] = 3;
    allow_bounce = 0;
    
    //Snap into the slope
	if (other.sprite_width < 17) {
		
		x = other.x + 8;
		y = other.y + 8;
	}
	else
		move_snap(8, 8);
}