/// @description Donut logic

//Inherit the parent event
event_perform_object(obj_platformparent, ev_step, ev_step_end);

//Check for Mario
var mario = collision_rectangle(bbox_left, bbox_top-5, bbox_right, bbox_top+4, obj_mario, 0, 0);

//If not moving vertically
if (vspeed == 0) {

	//If Mario does exist and it's standing on this platform
	if (mario)
	&& (mario.state < playerstate.jump)
	&& (mario.bbox_bottom < yprevious+5)
		ready = 1; //Shake it and make it fall if Mario stands on it for too long

	//Otherwise, stop shaking
	else {
		
		ready = 0;
		alarm[0] = 8;
		alarm[1] = 1;
	}
}

//Otherwise, if falling down
else if (vspeed > 0) {

	//Set falling state
	ready = 2;
	
	//If Mario does exist
	if (mario)
	&& (mario.state < playerstate.jump)
	&& (mario.bbox_bottom < yprevious+5) {
	
		//Check for a donut
		var check = collision_rectangle(mario.bbox_left, bbox_top-5, mario.bbox_right, bbox_top+1, obj_semisolid, 0, 1);
		var check2 = collision_rectangle(mario.bbox_left, bbox_top-5, mario.bbox_right, bbox_top+1, obj_semisolid, 0, 1);
	
		//If there's a donut in position
		if (check)
		&& ((!check2)
		|| (((check2.object_index = obj_donut) || (check2.object_index == obj_donut_red) || (check2.object_index == obj_donut_triple) || (check2.object_index == obj_donut_triple_red)) && ((check2.y > y) || ((check2.y = y) && (check2 > id)))))  
			mario.y = ceil(bbox_top-15);
	}
}

//Destroy if below the view
if (ready == 2)
&& (bbox_top > (camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]))) {

	//Decrement respawn rate
	respawn--;
		
	//If the respawn rate is lower than 0
	if (respawn < 1) {
		
		//Increment scale
		scale += 0.05;
		if (scale > 1) {
			
			//Restart scale
			scale = 0;
				
			//Restart movement and position
			vspeed = 0;
			y = ystart;
				
			//Restart state
			ready = 0;
				
			//Restart timer
			respawn = 180;
		}
	}
}