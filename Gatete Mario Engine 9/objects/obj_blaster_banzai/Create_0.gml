/// @description Banzai Bill Blaster

//Shoot a Banzai Bill
alarm[0] = 90;

//Depth
depth = 150;

//Scale
scale = 1;

//Whether the cannon is scaling
ready = 0;

//Make the cannon solid
with (instance_create_layer(x, y, "Main", obj_solid)) {

	image_xscale = 4;
	image_yscale = 5;
}
