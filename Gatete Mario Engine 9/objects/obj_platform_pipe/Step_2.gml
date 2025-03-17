/// @description Moving pipe logic

//Inherit the parent event
event_inherited();

#region SCALE

	//If the ground exists...
	if (instance_exists(ground)) {

		//...set up the scale based on distance between the top of the pipe and the ground
		image_yscale = (ground.y - y) / 16;
	
		#region SIDE COLLISIONS
	
			//Left Side Collision
			with (mysolid_l) {
		
				y = other.y+4;
				image_yscale = (other.ground.y - y) / 16;
			}
	
			//Left Side Collision
			with (mysolid_r) {
		
				y = other.y+4;
				image_yscale = (other.ground.y - y) / 16;
			}
		#endregion
	}
	
	//Otherwise
	else {
	
		//...set up the scale based on distance between the top of the pipe and the height of the room
		image_yscale = ((room_height + 80) - y) / 16;
	
		#region SIDE COLLISIONS
	
			//Left Side Collision
			with (mysolid_l) {
		
				y = other.y+4;
				image_yscale = ((room_height + 80) - y) / 16;
			}
	
			//Left Side Collision
			with (mysolid_r) {
		
				y = other.y+4;
				image_yscale = ((room_height + 80) - y) / 16;
			}
		#endregion		
	}
	
#endregion

//Make the pipe stop when in contact with a end modifier
if (vspeed != 0) 
&& (collision_rectangle(bbox_left, y, bbox_right, y+15, obj_endmarker, 0, 0)) {

    //Snap to grid
    move_snap(16,16)
    
    //Stop movement
    vspeed = 0;
    
    //Move again
    alarm[0] = 120;
}
