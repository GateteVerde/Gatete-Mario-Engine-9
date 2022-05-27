/// @description Jump

//Set the horizontal speed
xspeed = 1.05 * sign(dir);

//Boost jump
yspeed = -6;
y--;

//Jump
jumping = 1;

//Reverse direction
dir = -dir;
