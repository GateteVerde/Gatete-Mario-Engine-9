/// @description Venus Fire Trap fireball logic

//Handle psuedo movement
if (freeze == false) {
	
	x += xspeed;
	y += yspeed;
}

//No gravity
yadd = 0;

//Leave a trail
if (sprite_index == spr_fireball) {

	numb++;
	if (numb mod 2)
		with (instance_create_depth(x, y+4, -1, obj_smoke))
		    sprite_index = spr_cinder;
}

//Destroy when outside view
if (outside_view() == true)
	instance_destroy();