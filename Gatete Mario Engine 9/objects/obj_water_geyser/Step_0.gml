/// @description Push Mario upwards if he is inside the geyser

//If Mario does exist
if (instance_exists(obj_mario)) {

	//If Mario is on this geyser and does not have the frog or penguin powerup, push him up
	if (collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_mario, 0, 0))
	&& (obj_mario.bbox_bottom > yprevious+5)
	&& (obj_mario.yspeed > -4)
	    obj_mario.yspeed -= 0.5;
}

//Manage geyser height
if (ready == 1) {

	//If the y position is lower than ystart position
	if (y < ystart) {

		//Stop vertical speed
		vspeed = 0;
		y = ystart;
		
		//Do not move and apply gravity after 6 seconds
		ready = 2;
		alarm[1] = 360;
	}
}

//Otherwise, if the fully risen...
else if (ready > 1) {

	//Wobble when upwards
	if (ready == 2)
		y = ystart + offset;
		
	//Otherwise, cap vertical speed
	else if ((ready == 3) && (y > room_height)) {
			
		//Stay in the bottom boundary
		y = room_height;
		
		//Stop vertical speed
		gravity = 0;
		vspeed = 0;
			
		//Stay there and rise up after 3 seconds
		ready = 0;
		alarm[0] = 180;
	}
}

//Set vertical scale
image_yscale = (room_height - y) / 16;

//Cap vertical speed
if (vspeed > 3)
	vspeed = 3;