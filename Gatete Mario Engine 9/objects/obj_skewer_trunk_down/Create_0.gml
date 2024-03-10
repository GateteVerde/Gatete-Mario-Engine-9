/// @description Downward skewer trunk

//Check if frozen
freeze = false

//Parent, if it exists
parent = -1;

//Whether the skewer is on the ground
ready = 0;

//Go up a bit
alarm[0] = 120;

//Freeze variables
save_ims = 0;
save_hsp = 0;
save_vsp = 0;
save_grav = 0;
for (var i=0; i<12; i++) {

	save_alm[i] = -1;
}

//Create block masher
masher = instance_create_layer(0, 0, "Main", obj_skewer_mask);
with (masher) {
	
	parent = other.id;
	sprite_index = spr_mask_skewer_v;
}