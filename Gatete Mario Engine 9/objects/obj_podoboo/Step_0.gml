/// @description Podoboo logic

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

//Bounce in contact with lava
lava = collision_rectangle(bbox_left, bbox_bottom+7, bbox_right, bbox_bottom+7, obj_lava, 0, 0);
if (lava) {

    //Bounce.
    if ((!ready) && (yspeed > 0)) {

        //Make it stop
        ready = true;
        
        //Stop after 10 steps
        alarm[0] = 10;
        
        //Create lava splash
        with (instance_create_depth(x, lava.y-4, -6, obj_smoke))
			sprite_index = spr_splash_lava;
    }
}

//Set xscale
xscale = 1;

//Set yscale and cap vertical speed
if (yspeed < 0)
	yscale = 1;
else if (yspeed > 0) {
	
	yscale = -1;
	if (yspeed > 6)
		yspeed = 6;
}
