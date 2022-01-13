/// @description Yoshi Powerup Egg

//Inherit the parent event
event_inherited();

//Set the vertical speed
yspeed = (place_meeting(x, y, obj_swim)) ? -1.5 : -3;