/// @description Rightward skewer trunk

//Parent, if it exists
parent = -1;

//Whether the skewer is on the ground
ready = 0;

//Go left a bit
alarm[0] = 120;

//Create block masher
masher = instance_create_layer(0, 0, "Main", obj_skewer_mask);
with (masher)
	parent = other.id;