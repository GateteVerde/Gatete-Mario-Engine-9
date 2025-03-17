/// @description Permanent Moving pipe logic

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
		image_yscale = (room_height - y) / 16;
	
		#region SIDE COLLISIONS
	
			//Left Side Collision
			with (mysolid_l) {
		
				y = other.y+4;
				image_yscale = (room_height - y) / 16;
			}
	
			//Left Side Collision
			with (mysolid_r) {
		
				y = other.y+4;
				image_yscale = (room_height - y) / 16;
			}
		#endregion		
	}
	
#endregion

//Arrow collision
if ((collision_rectangle(bbox_left, y, bbox_right, y+15, obj_up, 0, 0)) && (freeze == false))
    vspeed -= 0.0324;
else if ((collision_rectangle(bbox_left, y, bbox_right, y+15, obj_down, 0, 0)) && (freeze == false))
    vspeed += 0.0324;