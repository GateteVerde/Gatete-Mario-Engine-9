/// @description This collision happens if Mario jumps onto the platform.

/*

//If Mario's vertical speed is lower than 0.25
if (obj_mario.yspeed < playerfallspeed) {
    
	//If there's not a solid to the right
	if (position_meeting(x + sprite_width + 1, y, obj_solid)) {
		
	    //Animate
	    image_speed = 0.5;
        
	    //Set the horizontal speed
	    hspeed = 0.25;
        
	    //Stop it
	    alarm[0] = 30;
	}
}

//Check Mario's y
if ((obj_mario.y + (-sprite_get_height(obj_mario.sprite_index)) < y + 16) && (!place_meeting(x, y, obj_mario_marker_head))) {

    //If the platform is not spinning and not stuck on a solid.
    if (!isspin) {
    
        alarm[0] = -1;
        isspin = true;
    }
    
    //Animate
    image_speed = 0.5;
    
    //Set the horizontal speed
    hspeed = 0.25;
    
    //Stop it
    alarm[0] = 30;
}

*/