/// @description Set ice properties

if (ice == 1) {
	
	//Create slippery surface
	myslip = instance_create_layer(x, y-16, "Main", obj_slippery);
	with (myslip) {
		
		image_xscale = 3;
	}
	
	//Set up sprite
	if (sprite_index != spr_donut_triple_ice)
		sprite_index = spr_donut_triple_ice;
}
