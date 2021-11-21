/// @description Make the seesaw tilt

//Update slope increment variable
add = (dsin(image_angle) * 0.21) * - 1;

//Update extra
extra = 20+(abs(image_angle) / 20);

//Radius
radius = (sprite_width / 2 + sprite_height / 2) - 8;

#region SET SEESAW ANGLE

	//Set up list
	var see_list = ds_list_create();

	//Count how many items are above the seesaw
	var see_count = collision_circle_list(x, y, radius, obj_weightparent, 1, 0, see_list, 0);
	if (see_count > 0) {

		//Check for items under obj_weightparent
		for (var j = 0; j < see_count; j++) {

			//If the NPC vertical speed is equal or greater than 0
			if (see_list[| j].yspeed == 0) 
			&& (see_list[| j].bbox_bottom < self.bbox_bottom) {
				
				//Calculate distance
				var myincrement = sprite_get_width(sprite_index) / 4;
				var mydist = point_distance(x, y, see_list[| j].x, see_list[| j].y);

				//Set angle
				angle_speed += -((1/1000) * (((see_list[| j].x > x) * 2) - 1) * ((mydist / 16) * myincrement));
	
				//Set the item position
				with (see_list[| j]) {
	
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
			
						//Adjust object y position
				        y = see.y + fake_y - see.extra;
                
						//If platform ever moves horizontally, adjust object x position
						if (see.x != see.xprevious)
							x += (see.x-see.xprevious) * dcos(see.image_angle) * sign(see.angle_speed / 6);
					}
				}
			}		
		}		
	}
	
	//Otherwise, decrement angle speed
	else {
		
		angle_speed = max(0, abs(angle_speed)-0.04)*sign(angle_speed);
		if ((angle_speed > -0.04) && (angle_speed < 0.04))
			angle_speed = 0;
	}

	//Destroy the list
	ds_list_destroy(see_list);	
#endregion

//Set angle
image_angle += angle_speed;
	
//Cap angle
if (abs(image_angle) > 45) {
	
	image_angle = 45 * sign(image_angle);
	if (angle_speed != 0)
		angle_speed = 0;
}

//Cap angle speed
if (abs(angle_speed) > 2)
    angle_speed = 2 * sign(angle_speed);