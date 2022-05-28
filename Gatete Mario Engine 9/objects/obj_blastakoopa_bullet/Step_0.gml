/// @description Blasta Koopa bullet logic

//Manage pseudo movement variables
if (freeze == false) {

	x += xspeed;
	y += yspeed;
}

#region LOGIC

	//If the bullet can follow mario
	if (homing) {

	    //If Mario does exist
	    if (instance_exists(obj_mario)) {
    
	        //If Mario is at the right
	        if (obj_mario.x > x) {
        
	            xspeed += 0.025;
	            if (xspeed > 1.25)
	                xspeed = 1.25;
	        }
        
	        //Otherwise, if Mario is at the left
	        else if (obj_mario.x < x) {
        
	            xspeed += -0.025;
	            if (xspeed < -1.25)
	                xspeed = -1.25;
	        }
    
	        //If Mario is below
	        if (obj_mario.y > y) {
        
	            yspeed += 0.025;
	            if (yspeed > 1.25)
	                yspeed = 1.25;
	        }
        
	        //Otherwise, if Mario is above
	        else if (obj_mario.y < y) {
        
	            yspeed += -0.025;
	            if (yspeed < -1.25)
	                yspeed = -1.25;
	        }
	    }
	}
	
	//Facing direction
	if (xspeed > 0)
		sprite_index = spr_blastakoopa_missile_r;
	else if (xspeed < 0)
		sprite_index = spr_blastakoopa_missile_l;
#endregion

//Destroy if outside the view
if (x < camera_get_view_x(view_camera[0]) - 16)
|| (x > camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) + 16)
|| (y > camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) + 16)
    instance_destroy();
