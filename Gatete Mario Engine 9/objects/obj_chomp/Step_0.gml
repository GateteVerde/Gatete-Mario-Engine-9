/// @description Chain Chomp logic

//Handle pseudo movement variables
if (freeze == false) {

	x += xspeed;
	y += yspeed;
	yspeed += yadd;
}

//If the chain chomp is not lunging
if (lunge == false) {

    //Gravity
    yadd = 0.25;
    
    //Cap vertical speed
    if (yspeed > 4)
        yspeed = 4
}
else {

    yadd = 0;
}

//If the chain chomp is idle
if (idle) {

    //Reverse horizontal speed.
    if (x < stop_l)
        xspeed = 1
    if (x > stop_r)
        xspeed = -1
    
    //If Mario does exist
    if (instance_exists(obj_mario)) {
    
        //If Mario is on sight
        if ((point_distance(obj_mario.x, obj_mario.y, x, y) < 1.5*maxdist) && (!ready)) {
        
            //Do not retreat
            retreat = 0
            
            //Lunge
            lunge = 1
            
            //Do not idle
            idle = 0
            
            //Got Mario
            ready = 1;
            
            //Set the motion
            if (obj_mario.x < originx) {
			
				//Set motion
                motion_set(random(85)+90, 4);
				
				//Obtain motion
				xspeed = hspeed;
				yspeed = vspeed;
				hspeed = 0;
				vspeed = 0;
			}
            else {
				
				//Set motion
                motion_set(90-random(85),4);
				
				//Obtain motion
				xspeed = hspeed;
				yspeed = vspeed;
				hspeed = 0;
				vspeed = 0;
			}
        }
    }
}

//If the chain chomp is lunging
if (lunge) {

    //Find start position.
    start = instance_position(originx, originy, obj_chainchomp)
    
    //If the chomp is too far from the origin.
    if (x-originx > maxdist) {
    
        x = originx+maxdist
        alarm[0] = 60;
        xspeed = 0;
		yspeed = 0;
        with (start) {
        
            taunt = true;
        }   
    }
    else if (originx-x > maxdist) {
    
        x = originx-maxdist;
        alarm[0] = 60;
        xspeed = 0;
		yspeed = 0;
        with (start) {
        
            taunt = true;
        }   
    }
    
    //If the chomp is higher than the origin position.
    if (originy-y > maxdist) {
    
        y = originy-maxdist;
        alarm[0] = 60;
        xspeed = 0;
		yspeed = 0;
        with (start) {
        
            taunt = true;
        }   
    }
}

//If the chomp is retreating.
if (retreat) {
    
    if ((x < stop_l) && (xspeed < 0))
    || ((x > stop_r) && (xspeed > 0)) {
    
        //Do not lunge
        lunge = 0;
        
        //Idle
        idle = 1;
        
        //Do not retreat
        retreat = false;
    }
}

if ((idle) || (retreat)) {

    if ((x < originx) && (xprevious > originx))
        stop_l = originx-4-ceil(random(16));
    else if ((x > originx) && (xprevious < originx))
        stop_r = originx+4+ceil(random(16));
}

//Animate
image_speed = 1 + (1*lunge);

//Set the facing direction
if (xspeed > 0)
    xscale = 1;
else if (xspeed < 0)
    xscale = -1;