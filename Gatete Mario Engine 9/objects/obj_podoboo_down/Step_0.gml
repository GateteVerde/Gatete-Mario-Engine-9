/// @description Podoboo logic

#region LOGIC

	//Make it fall when reaching start position
	if ((y > ystart-39) && (ready == true)) {

	    //Make it fall.
	    ready = false;
	    gravity = 0.2;
		gravity_direction = 90;
	}

	//Bounce if outside the room
	if (bbox_top < -16) {

	    if (!ready) {
    
	        //Make it stop
	        ready = true;
        
	        //Stop after 10 steps
	        alarm[0] = 10;
	    }
	}
#endregion

//Bounce in contact with lava
lava = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_top, obj_lava, 0, 0);
if (lava) {

    //Bounce.
    if ((!ready) && (vspeed < 0)) {

        //Make it stop
        ready = true;
        
        //Stop after 10 steps
        alarm[0] = 10;
        
        //Create lava splash
        with (instance_create_depth(x, lava.bbox_bottom+12, -6, obj_smoke))
			sprite_index = spr_splash_lava_ceiling;
    }
}

//Set xscale
xscale = 1;

//Set yscale and cap vertical speed
if (vspeed > 0)
	yscale = -1;
else {
	
	yscale = 1;
	if (vspeed < -6)
		vspeed = -6;
}

//Set alternative sprite
if (obj_levelcontrol.lava_palette > 0)
	sprite_index = spr_podoboo_alt;