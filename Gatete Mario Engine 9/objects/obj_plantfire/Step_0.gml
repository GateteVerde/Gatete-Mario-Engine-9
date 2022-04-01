/// @description Venus Fire Trap fireball logic

//Handle psuedo movement
if (freeze == false) {
	
	x += xspeed;
	y += yspeed;
}

//No gravity
yadd = 0;

//Generate effect
numb++;
if (numb mod 2)
	with (instance_create_depth(x, y+4, -1, obj_smoke))
	    sprite_index = spr_cinder;	
