/// @description Resume walking

//Set horizontal speed based on direction
xspeed = (swimming) ? 0.4 * xscale : 0.8 * xscale;

//Animate
sprite_index = spr_beachkoopa_blue_walk;

//Stop kick
kicky = 0;