/// @description Jump towards Mario

//Set vertical speed
yspeed = (swimming) ? -3 : -6;

//Boost jump
y--;

//Do not animate
image_speed = 0;
image_index = 0;

//If Mario does not exist or it's at the left
if (!instance_exists(obj_mario))
|| (obj_mario.x < x)
    xspeed = (swimming) ? -0.525 : -1.05;
else
    xspeed = (swimming) ? 0.525 : 1.05;