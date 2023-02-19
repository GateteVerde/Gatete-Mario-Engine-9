/// @description Covers the entire level with water

//Set depth
depth = -7;

//Set alpha
alpha = 1;

//Create swimming object
with (instance_create_layer(0, 0, "Main", obj_swim)) {

	image_xscale = room_width / 16;
	image_yscale = room_height / 16;
}