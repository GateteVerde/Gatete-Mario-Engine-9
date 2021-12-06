/// @description Create semisolid mask

if ((image_angle == 90) || (image_angle == -270)) {
	
	with (instance_create_layer(x, y, "Main", obj_semisolid)) {
	
		sprite_index = spr_mask_oneway;
		image_angle = other.image_angle;
		image_yscale = other.image_yscale;
	}
}