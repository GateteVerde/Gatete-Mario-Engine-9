/// @description Leave a trail of smoke

alarm[2] = 2;
with (instance_create_depth(x - 8 + random(16), y + random(16), -6, obj_smoke)) {

	sprite_index = spr_smoke_c;
	image_blend = c_ltgrey;
	vspeed = random_range(-0.5,-1.5);
}