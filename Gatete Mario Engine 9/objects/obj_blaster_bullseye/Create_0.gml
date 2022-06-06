/// @description Bullseye Bill Blaster

//Shoot a Bullseye Bill
mybullet = -1;
alarm[0] = 90;

//Scale
scale = 1;

//Whether the cannon is scaling
ready = 0;

//Make the cannon solid
with (instance_create_layer(x, y, "Main", obj_solid)) {

	image_xscale = 4;
	image_yscale = 5;
}
