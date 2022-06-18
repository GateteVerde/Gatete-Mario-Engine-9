/// @description Trouter logic

//Manage pseudo movement variables
if (freeze == false) {

	y += yspeed;
	yspeed += yadd;
}

#region LOGIC

	//Make it fall when reaching start position
	if ((y < ystart+39) && (ready == true)) {

	    //Make it fall.
	    ready = false;
	    yadd = 0.2;
	}

	//Bounce if outside the room
	if (bbox_top > room_height) {

	    if (!ready) {
    
	        //Make it stop
	        ready = true;
        
	        //Stop after 10 steps
	        alarm[0] = 10;
	    }
	}
#endregion

//Set xscale
xscale = 1;

//Set yscale and cap vertical speed
if (yspeed < 0)
	yscale = 1;
else if (yspeed > 0) {
	
	yscale = -1;
	if (yspeed > 4)
		yspeed = 4;
}
