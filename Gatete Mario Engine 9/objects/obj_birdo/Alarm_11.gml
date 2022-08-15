/// @description Become invulnerable

//Set the sprite
sprite_index = spr_birdo;

//Become vulnerable
invulnerable = false;

//Animate
image_speed = 1;

//Jump
alarm[0] = irandom_range(16, 64)

//Shoot an egg
alarm[1] = irandom_range(60, 180);

//Set the horizontal speed
xspeed = 0.5 * dir;