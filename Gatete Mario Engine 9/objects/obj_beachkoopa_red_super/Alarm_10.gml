/// @description Move towards Mario

//If the NPC is outside the view, hold
if (outside_view() == true) {
	
	alarm[10] = 2;
	exit;
}

//Move down
yspeed = 2;
alarm[0] = 20;

//Inherit the parent event
if (!instance_exists(obj_mario))
|| (obj_mario.x < x)
	xspeed = -1.5;
else
	xspeed = 1.5;