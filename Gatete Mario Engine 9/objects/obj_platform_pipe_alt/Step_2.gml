/// @description Permanent Moving pipe logic

//Inherit the parent event
event_inherited();

#region SCALE

	//Check for the nearest semisolid below...
	var ground = collision_rectangle(x+16, bbox_bottom, x+16, bbox_bottom+999999, obj_semisolid, 0, 1);

	//...and set the vertical scale of the pipe.
	image_yscale = (ground.y - y) / 16;
	
	#region SIDE COLLISIONS
	
		//Left Side Collision
		with (mysolid_l) {
		
			y = other.y+4;
			image_yscale = (ground.y - y) / 16;
		}
	
		//Left Side Collision
		with (mysolid_r) {
		
			y = other.y+4;
			image_yscale = (ground.y - y) / 16;
		}
	#endregion
	
#endregion

//Arrow collision
if ((collision_rectangle(bbox_left, y, bbox_right, y+15, obj_up, 0, 0)) && (freeze == false))
    vspeed -= 0.0324;
else if ((collision_rectangle(bbox_left, y, bbox_right, y+15, obj_down, 0, 0)) && (freeze == false))
    vspeed += 0.0324;