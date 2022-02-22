/// @description Hammer logic

//Rotate based on horizontal speed
angle -= 10*(sign(hspeed))*abs(hspeed);

//Set horizontal scale
xscale = 1*sign(hspeed);

//Set horizontal speed
xspeed = other.hspeed;