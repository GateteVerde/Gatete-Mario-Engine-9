/// @description Volcano Lotus fireball logic

//Handle psuedo movement
if (freeze == false) {
	
	x += xspeed;
	y += yspeed;
	yspeed += yadd;
}

//Cap vertical speed or apply gravity
if (ready == 1) {

    if (yspeed > 3)
        yspeed = 3;
    else
        yadd = 0.025;
}

//Set rinka ring if this is a rinka projectile
if (rinka == true)
	sprite_index = spr_lotusball_rinka;
