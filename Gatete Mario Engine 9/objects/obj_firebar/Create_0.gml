/// @description Firebar

//Distance
dist = 8;

//Angle
angle = 0;

//Frame
frame = 0;

//Create firebars
alarm[0] = 2;

//Create a light
if (instance_exists(obj_lightcontrol)) {

	mylight = instance_create_layer(0, 0, "Main", obj_light_npc);
	with (mylight) {
		
		parent = other.id;
		radius = 4;
		new_radius = 4;
	}
}