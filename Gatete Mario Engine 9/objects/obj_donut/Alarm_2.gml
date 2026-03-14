/// @description Set ice properties

if (ice == 1) {
	
	//Create a slippery mask
	myslip = instance_create_layer(x, y-16, "Main", obj_slippery);
	with (myslip) {
	
		image_xscale = other.image_xscale;
	}
	
	//Set the ice sprite
	if (sprite_index != spr_donut_ice)
		sprite_index = spr_donut_ice;
}