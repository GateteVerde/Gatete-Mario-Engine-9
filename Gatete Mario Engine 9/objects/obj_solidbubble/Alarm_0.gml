/// @description Create collisions

//First of all, check if this bubble holds a star coin
if (sprout == 3) {

	//If the coin has been collected, destroy
	if (ds_map_find_value(global.sc[sc_type], global.level) == 1) {
		
		instance_destroy();
		exit;
	}
}

//Top
myt = instance_create_layer(x, y, "Main", obj_slopeparent);
with (myt) {

	sprite_index = spr_mask_solidbubble_top;
	add = 0;
}

//Bottom
myb = instance_create_layer(x, y, "Main", obj_solid);
with (myb) {

	sprite_index = spr_mask_solidbubble_bottom;
}

//Allow bubble to be hit
canbehit = true;