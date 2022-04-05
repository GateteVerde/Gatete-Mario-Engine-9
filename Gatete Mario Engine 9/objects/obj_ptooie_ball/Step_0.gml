/// @description P-Tooie ball logic

//Keep parent activated
instance_activate_object(parent);

//Do not move if Mario is dead or transforming
if (!instance_exists(obj_mario_dead))
&& (!instance_exists(obj_mario_transform)) {

	//Set angle
	angle -= 12;
	
	//Set vertical speed
	y += yspeed;	
}

//If the plant is not blowing.
if (!parent.ready) {

    //If the ball is nearby the plant.
    if (y > parent.dist-40) {
    
        //If the ball is being blown.
        if (blown) {
        
            //Stop being blown.
            blown = false;
            
            //Make the plant blow again.
            with (parent) {
            
                alarm[0] = 120;
            }
        }
        
        //Set the ball speed
        yspeed -= 0.25;
    }
    
    //Otherwise, reduce speed
    else    
        yspeed += 0.125;        
}

//Otherwise, if the plant is blowing.
else if (parent.ready) {

    //If the ball is high enough.
    if (y < parent.dist-144) {
    
        //Set the vertical speed.
        yspeed += 0.125;
        
        //Get blown
        blown = 1;
        
        //Make the plant able to blow again.
        if (yspeed > 0)        
            parent.ready = false;
    }
    
    //Otherwise, reduce speed.
    else    
        yspeed -= 0.25;
}

//Cap vertical speed.
if (yspeed > 2.5)
	yspeed = 2.5;
else if (yspeed < -2.5)
	yspeed = -2.5;
