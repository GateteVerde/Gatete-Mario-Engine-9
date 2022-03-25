/// @description Custom Stomp script

//If this enemy has not been stomped yet
if (ready == 0) {

	//Set the sprite
	sprite_index = spr_rex_b;
	
	//Double horizontal speed
	xspeed = xspeed*2;
	
	//Set state
	ready = 1;
	
	//Set the new mask
	mask_index = spr_mask_npc_common_16x16;
}

//Otherwise if this enemy has been stomped once, turn into a pancake
else if (ready == 1) {
	
	//Turn into a pancake
	with (instance_create_depth(x, y+1, -6, obj_stomped)) {

		sprite_index = spr_rex_sq;
		image_xscale = other.xscale;
	}
	
	//Destroy
	instance_destroy();
}