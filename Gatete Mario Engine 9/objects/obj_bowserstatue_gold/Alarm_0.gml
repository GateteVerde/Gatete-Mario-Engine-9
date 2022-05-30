/// @description Jump towards Mario

//Animate
image_speed = 0;
image_index = 1;

//Set the vertical speed
yspeed = -4;

//Boost jump
y--;

//Jump
jumping = 1;

//If Mario does not exist or it's at the left, jump to the left
if (!instance_exists(obj_mario))
|| (obj_mario.x < x) {

    xspeed = -1.035;
    xscale = -1;
}

//Otherwise, jump to the right
else if (obj_mario.x > x) {

    xspeed = 1.035;
    xscale = 1;
}
