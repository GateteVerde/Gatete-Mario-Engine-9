/// @description Start moving

if (position_meeting(x, y, obj_up))
	vspeed = -1;
else if (position_meeting(x, y, obj_down))
	vspeed = 1;
else if (position_meeting(x, y, obj_left))
	hspeed = -1;
else
	hspeed = 1;