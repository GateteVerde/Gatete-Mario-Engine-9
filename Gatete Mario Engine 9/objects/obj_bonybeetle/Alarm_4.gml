/// @description Start walking again

//Set up the walking sprite
sprite_index = spr_bonybeetle;

//Set normal stomp grade
stomp = 4;

//Animate
image_speed = 1;

//Start walking
xspeed = (swimming) ? 0.25 * sign(xscale) : 0.5 * sign(xscale);

//Repeat process
alarm[0] = 180;
