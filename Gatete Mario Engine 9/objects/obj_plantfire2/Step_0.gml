/// @description Jumping Piranha Plant fireball logic

//Handle psuedo movement
if (freeze == false) {
	
	x += xspeed;
	y += yspeed;
	yspeed += yadd;
}

//Gravity
yadd = (sprite_index == spr_rockywrench_wrench) ? 0.02 : 0.2;
if (yspeed > 4) {

	yspeed = 4;
}

//Generate effect
numb++;
if ((numb mod 2) && (sprite_index == spr_fireball)) {
	
	with (instance_create_depth(x, y+4, -1, obj_smoke))
	    sprite_index = spr_cinder;
}
