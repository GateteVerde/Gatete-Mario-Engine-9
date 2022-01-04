/// @description SMB2 Holdable Item logic

//If the object is being held.
if (held) {

    //If the control key is being pressed and the vegetable can be thrown.
    if (input_check_pressed(input.action_1)) {
    
        //If the player does exist.
        if (instance_exists(obj_mario)) {
        
            //Play 'Throw' sound
            audio_play_sound(snd_throw, 0, false);
            
			//With Mario
            with (obj_mario) {
				
				holding = 0;
				kicking = 1;
				timer(kicking_end, 10, false);
			}
            
            //Check if 'Up' is pressed and throw the object upwards if so.
            if ((input_check(input.up)) || (gamepad_axis_value(0, gp_axislv) < -0.5)) {

                //Set the vertical speed
                yspeed = -6;
                yadd = 0.2;
                
                //Set the horizontal speed
                xspeed = obj_mario.xspeed/2;
            }
            
            //Otherwise, if it's not.
            else {
            
                //Set the vertical speed
                yspeed = 0.1;
                yadd = 0.2;
                
                //Set the horizontal speed
                if (obj_mario.xscale == 1)
                    xspeed = obj_mario.xspeed+2.5;
                else
                    xspeed = obj_mario.xspeed-2.5;
            }
            
            //Stop holding.
            held = false;
        }
    }
}
else {
	
	//Handle psuedo movement
	if (freeze == false) {
	
		x += xspeed;
		y += yspeed;
		yspeed += yadd;
	}
	
	//Gravity
	yadd = (swimming) ? 0.03125 : 0.25;
	
	//Vertical speed capacity
	yspeed = min(4 - (swimming * 2), yspeed);

    //Check for a water object
    var water = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_top, obj_swim, 0, 0);
    
    //If the object is not underwater and makes contact with water
    if (water) 
    && (!swimming) {
    
        //Make the object go underwater
        swimming = true;
        
        //Slowdown
        xspeed = xspeed/2;
        
        //Stop vertical movement
        yadd = 0;
        if (yspeed > 0)
            yspeed = 0;
    }
    
    //Otherwise, if the object is underwater and it's not underwater, end swimming.
    else if (!water) 
    && (swimming) {
    
        swimming = false;
        xspeed = xspeed*2;
    }
}