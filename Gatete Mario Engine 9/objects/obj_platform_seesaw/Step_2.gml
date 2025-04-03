/// @description Make the seesaw tilt

//Update slope increment variable
add = (dsin(image_angle) * 0.162) * - 1;

//Update extra
extra = 20+(abs(image_angle) / 20);

//Radius
radius = (sprite_width / 2 + sprite_height / 2) - 8;

//Volt direction
dir = (angle < 0) ? -1 : 1;

#region LOGIC

	//Create a list
	var list = ds_list_create();

	//Count items
	var count = collision_circle_list(x, y, radius, [obj_mario, obj_physicsparent], 0, 0, list, 0);
	if (count > 0) {

		//Iterate through all items
		for (var i=0; i<count; i++) {
			
			//Check where Mario is on the platform
			if (collision_circle(x, y, radius, list[| i], 1, 0)) {
				
				//If the listed item is Mario
				if (list[| i].object_index == obj_mario) {
					
					//If Mario is on this platform
					if (obj_mario.state != playerstate.jump)
					&& (obj_mario.bbox_bottom < bbox_bottom+4) {
						
						//Make the engine move if it is not moving
						if (parent != noone) {
							
							if (parent.state == "IDLE") {
						
								parent.state = "IN_LINE";
							}
						}
					
						//Calculate distance
						var myincrement = sprite_get_width(sprite_index) / 4;
						var mydist = point_distance(x, y, obj_mario.x, obj_mario.y);

						//Set angle
						angle_speed += -((1/1000) * (((obj_mario.x > x) * 2) - 1) * ((mydist / 16) * myincrement));
						
						//Snap the player horizontally
						obj_mario.x += x-xprevious;
					}
				}
				
				//Otherwise
				else {
					
					//If any NPC that is not Mario is on this platform
					if (list[| i].yadd == 0)
					&& (list[| i].bbox_bottom < bbox_bottom+4) 
					&& (list[| i].ignore_platforms == false) {
				
						//Calculate distance
						var myincrement = sprite_get_width(sprite_index) / 4;
						var mydist = point_distance(x, y, list[| i].x, list[| i].y);

						//Set angle
						angle_speed += -((1/1000) * (((list[| i].x > x) * 2) - 1) * ((mydist / 16) * myincrement));
						
						//Snap the NPC horizontally
						list[| i].x += x-xprevious;
					}
				}
			}
			
			//Otherwise
			else {
			
				//Otherwise, decrement angle speed
				angle_speed = max(0, abs(angle_speed)-0.0162)*sign(angle_speed);
				if ((angle_speed > -0.0162) && (angle_speed < 0.0162))
					angle_speed = 0;
			}
		}
	}

	//Destroy list
	ds_list_destroy(list);
	
#endregion

//Set angle
image_angle += angle_speed;
angle = image_angle;
	
//Cap angle
if (abs(image_angle) > 45) {
	
	image_angle = 45 * sign(image_angle);
	if (angle_speed != 0)
		angle_speed = -angle_speed/2;
}

//Cap angle speed
if (abs(angle_speed) > 2)
    angle_speed = 2 * sign(angle_speed);