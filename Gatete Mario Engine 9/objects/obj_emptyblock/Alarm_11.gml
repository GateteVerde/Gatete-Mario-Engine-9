/// @description Create solid mask

mysolid = instance_create_layer(xstart, ystart, "Main", obj_solid);
with (mysolid) {

	//Set up scale
	image_xscale = other.sprite_width/16;
	image_yscale = other.sprite_height/16;
	
	//If this is a coin roulette block
	if (other.sprite_index == spr_coinblock_large_empty) {
	
		x -= 6;
		y -= 12;
	}
}