/// @description Set ice properties

if (ice == 1) {
	
	myslip = instance_create_layer(x, y-16, "Main", obj_slippery);
	if (sprite_index != spr_donut_ice)
		sprite_index = spr_donut_ice;
}