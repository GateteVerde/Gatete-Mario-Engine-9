/// @description An enemy that has been killed

//Do not animate
image_speed = 0;

//Angle
angle = 0;

//Check if swimming
swimming = 0;

//Check sprite
alarm[0] = 1;

//Was the enemy sent flying?
fling = 0;

//Set the vertical speed if the enemy does not have any
if (vspeed == 0) {

	//Send the enemy higher if in contact with a spinner
	if (collision_rectangle(bbox_left-2, bbox_top-2, bbox_right+2, bbox_bottom+2, obj_mario_spinner, 0, 0)) {
		
		//If the powerup is not the ranger one
		if (global.powerup != cs_ranger) {
		
			vspeed = (position_meeting(x, bbox_top, obj_swim)) ? -1.5 : -6;
			fling = 1;
		}
		else
			vspeed = (position_meeting(x, bbox_top, obj_swim)) ? -1 : -4;
	}
	else {
		
		var block = collision_rectangle(bbox_left-2, bbox_top-2, bbox_right+2, bbox_bottom+2, obj_blockparent, 0, 0);
		
		//If this enemy was killed with a block
		if (block) 
		&& (block.speed != 0) {
			
			vspeed = (position_meeting(x, bbox_top, obj_swim)) ? -1.5 : -6;
			fling = 1;
		}
		else
			vspeed = (position_meeting(x, bbox_top, obj_swim)) ? -1 : -4;
	}
}