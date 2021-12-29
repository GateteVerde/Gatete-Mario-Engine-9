/// @description Fire from a firebar

//Do not animate
image_speed = 0;
image_index = 0;

//Do not animate.
angle = 0;

//Does mom exist?
mom = -1;

//Set the distance from the center.
length = 0;

//Create a light
if (instance_exists(obj_lightcontrol)) {

	with (instance_create_layer(0, 0, "Main", obj_light_npc)) {
		
		parent = other.id;
		radius = 8;
		new_radius = 8;
	}
}