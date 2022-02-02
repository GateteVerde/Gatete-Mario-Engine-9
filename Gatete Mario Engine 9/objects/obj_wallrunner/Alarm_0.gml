/// @description Sets the speed, direction and positioning

//Set direction
direction = desired_dir;
motion_set(direction, desired_speed);

//Positioning for Triangle Blocks
if (desired_offset_x <> 0) {
	
    x += desired_offset_x;
    y += desired_offset_y;
    desired_offset_x = 0;
    desired_offset_y = 0;
}

//Deletes the object if it is no longer in need.
if ((xscale > 0) && (direction == 0))
|| ((xscale < 0) && (direction == 180)) {

	//Make Mario snap into position
    obj_mario.x = x;
    obj_mario.y = y;
	
	//Set Mario horizontal speed
    obj_mario.xspeed = hspeed;
	
	//Make Mario visible
    obj_mario.visible = true;
    
	//Destroy this object
    instance_destroy()
}