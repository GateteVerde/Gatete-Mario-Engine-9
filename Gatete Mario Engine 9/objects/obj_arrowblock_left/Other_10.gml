/// @description Move the block upwards

//If there's not a solid above, animate
if (!collision_point(x-1, y, obj_solid, 1, 0))
	image_speed = 1;
        
//Otherwise
else {
    
	//Do not animate
	image_speed = 0;
	image_index = 0;
		
	//Allow block bump
	ready = 0;
}

//Stop moving
speed = 0;

//Stop both alarms
alarm[0] = -1;
alarm[1] = -1;