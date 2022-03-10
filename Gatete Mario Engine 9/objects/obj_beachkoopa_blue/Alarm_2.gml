/// @description Resume walking

//Set horizontal speed based on direction
xspeed = (swimming) ? 0.4 * xscale : 0.8 * xscale;

//Animate
image_speed = 1;

//Set sprite
sprite_index = spr_beachkoopa_blue_walk;

//Stop kick
kicky = 0;