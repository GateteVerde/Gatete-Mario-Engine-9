/// @description Super Acorn logic

//Inherit the parent event
event_inherited();

//Change angle based on horizontal speed
if (abs(xspeed) > 0)
	angle -= 7.5*sign(xspeed);