/// @description Resume movement

//Set the sprite
sprite_index = spr_birdo;

//Resume movement
image_speed = 1;

//Shoot an egg
alarm[2] = (type > 0) ? 90 : 180;

//End shooting
shooting = 0;

//Set the horizontal speed
xspeed = 0.5 * dir;