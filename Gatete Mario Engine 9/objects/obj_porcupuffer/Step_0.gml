/// @description Porchu puffer logic

//Manage pseudo movement variables
if (freeze == false) {

	x += xspeed;
	y += yspeed;
}

#region LOGIC

	//If not chargin at Mario
	if (charge == 0) {

	    //Activate when close to view
	    if (point_in_rectangle(x, y, camera_get_view_x(view_camera[0]) - 32, camera_get_view_y(view_camera[0]) - 32, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) + 32, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) + 32))
	        charge = 1;
	}

	//Otherwise, charge at Mario
	else if (charge == 1) {
    
	    //If Mario does not exist
	    if (instance_exists(obj_mario)) { 
			
			//If Mario is at the left, move to the left
	        if (obj_mario.x < x) {
        
				x += obj_mario.xspeed / 1.5;
	            xspeed -= 0.025;
	            xscale = -1;
	            if (xspeed < -1.5)
	                xspeed = -1.5;    
	        }
        
	        //Otherwise, go to the right
	        else if (obj_mario.x > x) {
        
				x += obj_mario.xspeed / 1.5;
	            xspeed += 0.025;
	            xscale = 1;
	            if (xspeed > 1.5)
	                xspeed = 1.5;
	        }
	    }
    
		//Make sure it does not exit the view boundaries
	    if (x < camera_get_view_x(view_camera[0]) - 32)
	        x = camera_get_view_x(view_camera[0]) - 32;
	    else if (x > camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) + 32)
	        x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) + 32;
	}
	
#endregion

//Set y position while on water
if (charge)
&& (collision_rectangle(bbox_left, bbox_top, bbox_right, y, obj_swim, 0, 0))
    y -= 0.25;
