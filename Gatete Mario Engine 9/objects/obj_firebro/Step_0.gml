/// @description Fire Bro logic

//Inherit the parent event
event_inherited();
	
#region Face towards Mario

	if (!instance_exists(obj_mario))
	|| (obj_mario.x < x)
		xscale = -1;
	else
		xscale = 1;
	
#endregion

//Turn around
if ((xspeed > 0) && (x > xstart+16))
|| ((xspeed < 0) && (x < xstart-16))
	xspeed = -xspeed;