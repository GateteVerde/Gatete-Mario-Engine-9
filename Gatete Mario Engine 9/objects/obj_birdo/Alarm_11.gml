/// @description Become vulnerable

//Set the sprite
sprite_index = spr_birdo;

//Become vulnerable
invulnerable = false;

//Animate
image_speed = 1;

//Jump
alarm[1] = irandom_range(16, 64)

//Shoot an egg
alarm[2] = 180;

//Set the horizontal speed
xspeed = 0.5 * dir;