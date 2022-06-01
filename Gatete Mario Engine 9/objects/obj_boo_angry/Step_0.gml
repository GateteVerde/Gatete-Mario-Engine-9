/// @description Angry Boo logic

//Set sprite
sprite_index = (movenow) ? spr_boo_angry : spr_boo_angry_lookout;

//Manage pseudo movement variables
if (freeze == false) {

	x += xspeed;
	y += yspeed;
}

#region LOGIC

	//If Mario does exist and it's not looking at him.
	if (instance_exists(obj_mario))
	&& (movenow = 1) {

	    //If Mario is at the right
	    if (obj_mario.x > x+8) {
    
			//Set facing direction
			xscale = 1;
			
			//Build speed
			xspeed += 0.0486;
			if (xspeed > 1)
				xspeed = 1;
	    }
    
	    //Otherwise, if Mario is at the left
	    else if (obj_mario.x < x-8) {
			
			//Set facing direction
			xscale = -1;
			
			//Build speed
			xspeed += -0.0486;
			if (xspeed < -1)
				xspeed = -1;
	    }
    
	    //If Mario is below
	    if (obj_mario.y > y+8) {
			
	        yspeed += 0.0486;
			if (yspeed > 1)
				yspeed = 1;
		}
    
	    //Otherwise, if it's above
	    else if (obj_mario.y < y+8) {
			
	        yspeed -= 0.0486;
			if (yspeed < -1)
				yspeed = -1;
		}
	}

	//Otherwise, stop moving
	else {
		
		//Slow horizontally
		xspeed = max(0, abs(xspeed)-0.0486)*sign(xspeed);
		if (abs(xspeed) < 0.0486)
			xspeed = 0;
			
		//Slow horizontally
		yspeed = max(0, abs(yspeed)-0.0486)*sign(yspeed);
		if (abs(yspeed) < 0.0486)
			yspeed = 0;	
	}

	//Remember state
	movenowprev = movenow;

	//Check if Mario is not looking at the boo
	if (instance_exists(obj_mario)) {

	    //If Mario is not spinjumping
	    if (obj_mario.jumpstyle != 1) {
    
	        //If Mario is at the right of the boo
	        if (obj_mario.x > x+8)
				movenow = (obj_mario.xscale == 1) ? 0 : 1;
        
	        //Otherwise if Mario is at the left of the boo
	        else if (obj_mario.x < x-8)
				movenow = (obj_mario.xscale == -1) ? 0 : 1;
        
	        //Otherwise, do not move
	        else
	            movenow = 0;
	    }
    
	    //Otherwise, stop
	    else
	        movenow = 0;
	}

	//Otherwise, do not move
	else	
	    movenow = 0;
	
#endregion

//Play 'Boo' sound if it was not moving
if (movenow == 1)
&& (movenowprev == 0)
&& (outside_view() == false)
    audio_play_sound(snd_boo, 0, false);
