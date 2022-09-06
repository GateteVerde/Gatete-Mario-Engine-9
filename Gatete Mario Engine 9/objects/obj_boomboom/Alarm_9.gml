/// @description Jump towards the player

//Animate
image_speed = 0.2 * increment;

//Jump
yspeed = -6;
y--;

//Jump again
alarm[1] = 120;

//Follow Mario
alarm[11] = 60;

//Go after Mario
if ((!instance_exists(obj_mario)) || (obj_mario.x < x))
    xspeed = -1*increment;
else
    xspeed = 1*increment;