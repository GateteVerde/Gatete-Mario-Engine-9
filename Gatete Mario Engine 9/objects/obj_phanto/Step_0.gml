/// @description Phanto logic

//Handle pseudo movement variables
if (freeze == false) {

	x += xspeed;
	y += yspeed;
}

//If not moving
if (ready == 0) {

    //If a key has been pulled
    if (instance_exists(obj_pullkey_up)) {
    
        //Animate
        image_speed = 1;
        
        //Get triggered
        ready = 1;
		
		//Play 'Phanto' sound
		alarm[1] = 45;
        
        //Begin chase
        alarm[2] = 90;
		alarm[3] = 1;
    }
}

//Otherwise, if moving
else if (ready == 2) {

    //If the key exists
    if (instance_exists(obj_pullkey_up)) {
    
        //If the key is being held
        if (obj_pullkey_up.held) {
    
            //If Mario does exist
            if (instance_exists(obj_mario)) {
            
                //If Mario is at the left
                if (obj_mario.x < x)
                    xspeed += -0.05;
                    
                //If Mario is at the right
                if (obj_mario.x > x)
                    xspeed += 0.05;
                    
                //If Mario is above
                if (obj_mario.y < y)
                    yspeed += -0.05;
                    
                //If Mario is below
                if (obj_mario.y > y)
                    yspeed += 0.05;
            }
            
            //Otherwise, move away from the view
            else {
            
                if (x > camera_get_view_x(view_camera[0])-128)
                    xspeed -= 0.05;
                if (x < camera_get_view_x(view_camera[0])-128)
                    xspeed += 0.05;
                if (y > camera_get_view_y(view_camera[0])-128)
                    yspeed -= 0.05;
                if (y < camera_get_view_y(view_camera[0])-128)
                    yspeed += 0.05;            
            }
        }
        
        //Otherwise, move away from the view
        else {
        
            if (x > camera_get_view_x(view_camera[0])-128)
                xspeed -= 0.05;
            if (x < camera_get_view_x(view_camera[0])-128)
                xspeed += 0.05;
            if (y > camera_get_view_y(view_camera[0])-128)
                yspeed -= 0.05;
            if (y < camera_get_view_y(view_camera[0])-128)
                yspeed += 0.05;           
        }
    }
    
    //Otherwise, move away from the view
    else {
    
        if (x > camera_get_view_x(view_camera[0])-128)
            xspeed -= 0.05;
        if (x < camera_get_view_x(view_camera[0])-128)
            xspeed += 0.05;
        if (y > camera_get_view_y(view_camera[0])-128)
            yspeed -= 0.05;
        if (y < camera_get_view_y(view_camera[0])-128)
            yspeed += 0.05;     
    }
}

#region SCALE

	//If the phanto is moving
	if ((ready == 2)  && (freeze == false)) {

	    //If the key exists
	    if (instance_exists(obj_pullkey_up)) {
    
	        //If the key is being held
	        if (obj_pullkey_up.held) {
				
				//Set vulnerability
				vulnerable = 3;
				stomp = 2;
    
	            //Decrement scale
	            scale -= 0.0125;
	            if (scale < 0.5)
	                scale = 0.5;
	        }
        
	        //Otherwise
	        else {
				
				//Set vulnerability
				vulnerable = 100;
				stomp = -1;
        
	            //Increment scale
	            scale += 0.0125;
	            if (scale > 1)
	                scale = 1;
	        }
	    }
    
	    //Otherwise, increment scale
	    else {
			
			//Set vulnerability
			vulnerable = 100;
			stomp = -1;
    
			//Increment scale
	        scale += 0.0125;
	        if (scale > 1)
	            scale = 1;
	    }
	}

	//Change normal scale
	image_xscale = scale;
	image_yscale = scale;
#endregion

//Cap horizontal / vertical speed
if (abs(xspeed) > 2.5)
	xspeed = 2.5 * sign(xspeed);
if (abs(yspeed) > 2.5)
	yspeed = 2.5 * sign(yspeed);