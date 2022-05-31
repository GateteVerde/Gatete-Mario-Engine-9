/// @description Big Boo logic

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
	    if (obj_mario.x > x+32) {
    
			//Set facing direction
			if (prevxscale != 1) 
			&& (sprite_index != spr_boo_big_turn) {
				
				//Set turning pose
				sprite_index = spr_boo_big_turn;
				
				//Animate
				image_speed = 1;
				image_index = 0;
				
				//Set scale
				prevxscale = 1;
			}
			
			//Build speed
			xspeed += 0.0324;
			if (xspeed > 0.75)
				xspeed = 0.75;
	    }
    
	    //Otherwise, if Mario is at the left
	    else if (obj_mario.x < x-32) {
			
			//Set facing direction
			if (prevxscale != -1) 
			&& (sprite_index != spr_boo_big_turn) {
				
				//Set turning pose
				sprite_index = spr_boo_big_turn;
				
				//Animate
				image_speed = 1;
				image_index = 0;
				
				//Set scale
				prevxscale = -1;
			}
			
			//Build speed
			xspeed += -0.0324;
			if (xspeed < -0.75)
				xspeed = -0.75;
	    }
    
	    //If Mario is below
	    if (obj_mario.y > y) {
			
	        yspeed += 0.0324;
			if (yspeed > 0.75)
				yspeed = 0.75;
		}
    
	    //Otherwise, if it's above
	    else if (obj_mario.y < y) {
			
	        yspeed -= 0.0324;
			if (yspeed < -0.75)
				yspeed = -0.75;
		}
	}

	//Otherwise, stop moving
	else {
		
		//Slow horizontally
		xspeed = max(0, abs(xspeed)-0.0324)*sign(xspeed);
		if (abs(xspeed) < 0.0324)
			xspeed = 0;
			
		//Slow horizontally
		yspeed = max(0, abs(yspeed)-0.0324)*sign(yspeed);
		if (abs(yspeed) < 0.0324)
			yspeed = 0;	
	}

	//Remember state
	movenowprev = movenow;

	//Check if Mario is not looking at the boo
	if (instance_exists(obj_mario)) {

	    //If Mario is not spinjumping
	    if (obj_mario.jumpstyle != 1) {
    
	        //If Mario is at the right of the boo
	        if (obj_mario.x > x+32)
				movenow = (obj_mario.xscale == 1) ? 1 : 0;
        
	        //Otherwise if Mario is at the left of the boo
	        else if (obj_mario.x < x-32)
				movenow = (obj_mario.xscale == -1) ? 1 : 0;
        
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
    audio_play_sound(snd_boo_big, 0, false);
