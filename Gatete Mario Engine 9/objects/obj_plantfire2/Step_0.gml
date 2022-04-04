/// @description Jumping Piranha Plant fireball logic

//Handle psuedo movement
if (freeze == false) {
	
	x += xspeed;
	y += yspeed;
	yspeed += yadd;
}

//Gravity
yadd = 0.2;
if (yspeed > 4) {

	yspeed = 4;
}

//Generate effect
numb++;
if (numb mod 2)
	with (instance_create_depth(x, y+4, -1, obj_smoke))
	    sprite_index = spr_cinder;	
