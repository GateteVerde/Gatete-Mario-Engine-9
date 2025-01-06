/// @description Create solid mask

var obj = (semisolid == false) ? obj_solid : obj_semisolid

mysolid = instance_create_layer(xstart, ystart, "Main", obj);
with (mysolid) {

	//Set up scale
	image_xscale = other.sprite_width/16;
	
	//Set up vertical scale
	if (obj != obj_semisolid) {
		
		image_yscale = other.sprite_height/16;
	
		//If this is a coin roulette block
		if (other.sprite_index == spr_coinrouletteblock_empty) {
	
			x -= 6;
			y -= 12;
		}
	}
}