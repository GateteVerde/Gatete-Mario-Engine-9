/// @description Fire Spike fireball logic

//Handle psuedo movement
if (freeze == false) {
	
	x += xspeed;
	y += yspeed;
}

//No gravity
yadd = 0;

//Leave a trail
if (sprite_index == spr_heavyfirebro_fireball) {

	numb++;
	if (numb mod 2)
		with (instance_create_depth(x-8 + random(16), y + random(16), -1, obj_smoke))
		    sprite_index = spr_cinder;
}

//Destroy when outside
if (outside_view() == true) 
&& (y > camera_get_view_y(view_camera[0]))
    instance_destroy();