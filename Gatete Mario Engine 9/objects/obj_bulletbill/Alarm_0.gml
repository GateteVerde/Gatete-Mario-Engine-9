/// @description Create smoke effect if this is a cannon ball

if (sprite_index != spr_cannonball)
&& (sprite_index != spr_cannonball_red)
exit;	
	instance_create_depth(x, y, -6, obj_smoke);