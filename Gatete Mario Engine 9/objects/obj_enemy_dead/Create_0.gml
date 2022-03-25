/// @description An enemy that has been killed

//Do not animate
image_speed = 0;

//Angle
angle = 0;

//Check if swimming
swimming = 0;

//Check sprite
alarm[0] = 1;

//Set the vertical speed
if (vspeed == 0)
	vspeed = (position_meeting(x, bbox_top, obj_swim)) ? -1 : -4;