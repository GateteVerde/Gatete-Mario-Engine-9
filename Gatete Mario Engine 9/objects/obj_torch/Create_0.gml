/// @description Torch

//Create light if the controller is present
if (instance_exists(obj_lightcontrol)) {
	
	with (instance_create_layer(x + 8, y + 8, "Main", obj_light_static)) {
		
		radius = 48;
		image_blend = c_orange;
	}
}