/// @description Turn into a stunned bobomb

with (instance_create_depth(x, y, -2, obj_bobomb_down)) {

	sprite_index = spr_bobomb_cannon_down;
	alarm[0] = max(alarm[0], 30);
	alarm[1] = max(alarm[1], 30);
	dir = 1 * sign(other.xscale);
}
instance_destroy();
