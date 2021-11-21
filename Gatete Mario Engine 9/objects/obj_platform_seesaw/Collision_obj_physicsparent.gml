/// @description Make the platform tilt

if (other.yadd == 0) {

	//Set angle
	#region ANGLE
		
		//If Mario is at the right of this platform
		if (other.x > x)
			angle_speed += -0.04;
				
		//Otherwise
		else if (other.x < x)
			angle_speed += 0.04;
	#endregion
	
	//Set Mario's position
	with (other) {
	
		//Check seesaw
		var see = collision_rectangle(bbox_left, bbox_bottom-2, bbox_right, bbox_bottom+4, obj_platform_seesaw, 1, 0);
		
		//If there's a seesaw
		if (see) 
		&& (!collision_rectangle(bbox_left, bbox_bottom-1, bbox_right, bbox_bottom+2, obj_semisolid, 1, 0)) {
				
			//Make a theoretical triangle in order to calculate the y position
	        var real_y = -(x-see.x)*dsin(see.image_angle); 
	        var real_x = (x-see.x)*dcos(see.image_angle);
	        var fake_x = x - see.x;
	        var fake_y = clamp(real_y*fake_x/real_x, -see.sprite_width/2, see.sprite_width/2);
			
			//Adjust players y position
	        y = see.y + fake_y - see.extra;
                
			//If platform ever moves horizontally, adjust players x
			if (see.x != see.xprevious)
				x += (see.x-see.xprevious) * dcos(see.image_angle) * sign(see.angle_speed / 6);
		}
	}
}