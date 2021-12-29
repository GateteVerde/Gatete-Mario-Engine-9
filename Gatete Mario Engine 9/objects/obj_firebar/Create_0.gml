/// @description Firebar

/*
**  This item uses creation code!
**
**  clockwise   = Direction of the discs
**      1: Right
**      -1: Left
**  length      = Length of the firebar (Not counting the middle one)
**  myspeed     = Speed of the firebar
*/

//Default variables
clockwise = 1;
length = 6;
myspeed = 1.5;

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

	with (instance_create_layer(x + 8, x + 8, "Main", obj_light_npc)) {
		
		parent = other.id;
		radius = 8;
		new_radius = 8;
	}
}