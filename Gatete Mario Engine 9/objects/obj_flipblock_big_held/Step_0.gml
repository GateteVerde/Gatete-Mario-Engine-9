/// @description Held Large Flip Block

//Inherit the parent event
event_inherited();

//Animate when not held
if (!held)
	angle -= 10 * sign(xspeed);